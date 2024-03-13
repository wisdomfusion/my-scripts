#!/usr/bin/env bash
# deploy_next.sh
# Deploy Script for Next.js Application

# 约定：
# 1. 应用名称：对应 git repo 名称
# 2. Next.js 应用已配置为 standalone output 模式
# 3. 使用 pm2 管理应用进程
# 4. 常用目录或路径：
#   - rsync user 为 root，做好安全加固
#   - rsync src 路径为约定预定义路径
#   - 编译脚本日志路径
#
# 脚本参数：
# -n 应用名称
# -e 可选，部署环境：prod 生产环境（默认，空），stage 预发环境，预发环境的路径中添加 `stage_`
# -p pm2 ecosystem.config.js 中的环境名称，可指定 production, staging, development
# -h 编译服务器 IP，开启 rsyncd
# eg. ./deploy_next.sh -n "project-web-next" -p production -h "172.17.212.193"

APP_NAME=""   # 应用名称，如 project-web-next
DEPLOY_ENV="" # 部署环境
PM2_ENV=""    # pm2 ecosystem.config.js 中的环境名称
RSYNC_HOST="" # 编译服务器 IP

# 处理命名参数
while getopts ":n:e:p:h:" opt; do
    case ${opt} in
    n) APP_NAME="$OPTARG" ;;
    e) DEPLOY_ENV="$OPTARG" ;;
    p) PM2_ENV="$OPTARG" ;;
    h) RSYNC_HOST="$OPTARG" ;;
    \?)
        echo "Invalid option: -$OPTARG" >&2
        exit 1
        ;;
    :)
        echo "Option -$OPTARG requires an argument" >&2
        exit 1
        ;;
    esac
done
shift $((OPTIND - 1))

# 检查必选参数是否为空
if [[ -z "$APP_NAME" || -z "$PM2_ENV" || -z "$RSYNC_HOST" ]]; then
    echo "Usage: $0 -n <APP_NAME> -e <DEPLOY_ENV> -p <PM2_ENV> -h <RSYNC_HOST>" >&2
    exit 1
fi

# 编译制品 rsync src
RSYNC_SRC="root@${RSYNC_HOST}::data/artifacts/frontend/${DEPLOY_ENV}${APP_NAME}/"
# 应用部署目录 rsync dest
APP_DIR="/data/www/nodejs/${APP_NAME}/"
# 脚本所在目录
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
# 脚本执行日志
LOG_FILE="${SCRIPT_DIR}/deploy_logs"

log_error() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] [ERROR] ${DEPLOY_ENV}${APP_NAME} $1" >>"$LOG_FILE"
    echo "[ERROR] $1"
}

log_info() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] [INFO] ${DEPLOY_ENV}${APP_NAME} $1" >>"$LOG_FILE"
    echo "[INFO] $1"
}

echo "Starting application deployment..."

echo "Starting to sync application artifact..."
# TODO: backup working version
if ! rsync -a --delete $RSYNC_SRC $APP_DIR; then
    log_error "Failed to sync application artifact"
    exit 1
fi

echo "Changing directory to $APP_DIR..."
cd "$APP_DIR" || {
    log_error "Failed to change directory to application"
    exit 1
}

pm2 show "$APP_NAME" &>/dev/null
if [[ $? -eq 0 ]]; then
    log_info "Application is already running. Restarting..."
    pm2 restart "$APP_NAME"

    sleep 5

    pm2 show "$APP_NAME" | grep -q "status.*online" &>/dev/null
    if [[ $? -eq 0 ]]; then
        log_info "Application restarted successfully"
    else
        log_error "Failed to restart application"
        exit 1
    fi
else
    log_info "Starting application..."
    pm2 start ecosystem.config.js --env $PM2_ENV

    sleep 5

    pm2 show "$APP_NAME" | grep -q "status.*online" &>/dev/null
    if [[ $? -eq 0 ]]; then
        log_info "Application started successfully"
    else
        log_error "Failed to start application"
        exit 1
    fi
fi

log_info "****** Application deploy completed successfully ******"
