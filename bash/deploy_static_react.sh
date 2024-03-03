#!/usr/bin/env bash
# deploy_static_react.sh
# Deploy Script for Static React.js Application

# 约定：
# 1. 应用名称：对应 git repo 名称
# 2. 常用目录或路径：
#   - rsync user 为 root，做好安全加固
#   - rsync src 路径为约定预定义路径
#   - 编译脚本日志路径
#
# 脚本参数：
# -n 应用名称
# -d 应用程序域名
# -e 可选，部署环境：prod 生产环境（默认，空），stage 预发环境，预发环境的路径中添加 `stage_`
# -h, --rsync-host 编译服务器 IP，开启 rsyncd
# eg. ./deploy_static_react.sh -n "boss-web" -d "console.cn-healthcare.com" -h "172.17.212.193"

APP_NAME=""   # 应用名称，如 boss-web
APP_DOMAIN="" # 应用程序域名，如 boss-web 域名为 console.cn-healthcare.com
DEPLOY_ENV="" # 部署环境：prod 生产环境（默认，空），stage 预发环境，预发环境的路径中添加 `stage_`
RSYNC_HOST="" # 编译服务器 IP

# 处理命名参数
while getopts ":n:d:e:h:" opt; do
    case ${opt} in
    n) APP_NAME="$OPTARG" ;;
    d) APP_DOMAIN="$OPTARG" ;;
    e) DEPLOY_ENV="$OPTARG" ;;
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
if [[ -z "$APP_NAME" || -z "$APP_DOMAIN" || -z "$RSYNC_HOST" ]]; then
    echo "Usage: $0 -n <APP_NAME> -d <APP_DOMAIN> -e <DEPLOY_ENV> -h <RSYNC_HOST>" >&2
    exit 1
fi

# 编译制品 rsync src
RSYNC_SRC="root@${RSYNC_HOST}::data/git_repos/frontend/${DEPLOY_ENV}${APP_NAME}/build/"
# 应用部署目录 rsync dest
APP_DIR="/data/www/${APP_DOMAIN}/"
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

echo "Starting to deploy application..."

echo "Starting to sync application artifact..."
# TODO: backup working version
if ! rsync -a --delete $RSYNC_SRC $APP_DIR; then
    log_error "Failed to sync application artifact"
    exit 1
fi

chown -R www-data:www-data $APP_DIR

log_info "****** Application deploy completed successfully ******"
