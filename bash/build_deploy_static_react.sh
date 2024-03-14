#!/usr/bin/env bash
# build_deploy_static_react.sh
# Build Script for Static React.js Application

# 约定：
# 1. 应用名称：对应 git repo 名称
# 2. 常用目录或路径：
#   - 应用 git 代码目录，事先完成 clone
#   - 编译脚本日志路径
#
# 脚本参数：
# -n 应用名称
# -b 代码仓库分支名称
# -r 应用程序 package.json 中定义的 npm run 执行脚本名称
# -e 可选，部署环境：prod 生产环境（默认，空），stage 预发环境，预发环境的路径中添加 `stage_`
# -h 可选，部署主机列表
# eg. ./build_deploy_static_react.sh -n "boss-web" -b main -r prod -e prod -h "172.17.212.190"

APP_NAME=""    # Node.js/Express 应用名称，如 med-selection-web
GIT_BRANCH=""  # git 分支名称，生产环境 main，预发环境 stage
NPM_RUN=""     # 子项目 app_assets 的 package.json 中定义的 npm run 执行脚本名称，如 prod
DEPLOY_ENV=""  # 部署环境：prod 生产环境（默认，空），stage 预发环境，预发环境的路径中添加 `stage_`
DEPLOY_HOST="" # 部署主机列表，如 172.17.212.190 或 172.17.212.190,172.17.212.191

# 处理命名参数
while getopts ":n:b:r:e:h:" opt; do
    case ${opt} in
    n) APP_NAME="$OPTARG" ;;
    b) GIT_BRANCH="$OPTARG" ;;
    r) NPM_RUN="$OPTARG" ;;
    e) DEPLOY_ENV="$OPTARG" ;;
    h) DEPLOY_HOST="$OPTARG" ;;
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
if [[ -z "$APP_NAME" || -z "$GIT_BRANCH" || -z "$NPM_RUN" ]]; then
    echo "Usage: $0 -n <APP_NAME> -b <GIT_BRANCH> -r <NPM_RUN> -e <DEPLOY_ENV> -h <DEPLOY_HOST>" >&2
    exit 1
fi

if [ "$DEPLOY_ENV" = "prod" ]; then
    DEPLOY_ENV=""
elif [ "$DEPLOY_ENV" = "stage" ]; then
    DEPLOY_ENV="stage_"
else
    DEPLOY_ENV=""
fi

# 应用代码目录
APP_SRC_DIR="/data/git_repos/${DEPLOY_ENV}frontend/${APP_NAME}/"
# 远程部署主机部署脚本路径
DEPLOY_SCRIPT="/data/deploy_scripts/auto_deploy_${APP_NAME}.sh"
# 脚本所在目录
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
# 脚本执行日志
LOG_FILE="${SCRIPT_DIR}/build_logs"

log_error() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] [ERROR] ${DEPLOY_ENV}${APP_NAME} $1" >>"$LOG_FILE"
    echo "[ERROR] $1"
}

log_info() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] [INFO] ${DEPLOY_ENV}${APP_NAME} $1" >>"$LOG_FILE"
    echo "[INFO] $1"
}

echo "Starting build process for $APP_NAME..."

echo "Changing directory to $APP_SRC_DIR..."
cd "$APP_SRC_DIR" || {
    log_error "Failed to change directory to ${APP_SRC_DIR}"
    exit 1
}

echo "Pulling code from git repository..."
git reset --hard && git clean -f && git pull && git checkout $GIT_BRANCH || {
    log_error "Failed to pull code from git repository"
    exit 1
}

echo "Installing dependencies using pnpm..."
if ! pnpm --registry https://registry.npmmirror.com install; then
    log_error "Failed to install dependencies"
    exit 1
fi

echo "Building application..."
if ! pnpm $NPM_RUN; then
    log_error "Failed to build application"
    exit 1
fi

log_info "Artifact prepared successfully"
log_info "****** Building tasks completed successfully ******"

if [[ -z "$DEPLOY_HOST" ]]; then
    exit 0
fi

echo "Starting to deploy artifact to servers..."

# 处理部署主机列表
IFS=',' read -ra HOST_LIST <<<"$DEPLOY_HOST" || {
    log_error "Failed to read deploy host"
    exit 1
}

for HOST in "${HOST_LIST[@]}"; do
    echo "--------------------------------------------------"
    log_info "Deploying to host: $HOST"

    ssh root@$HOST $DEPLOY_SCRIPT

    if [ $? -eq 0 ]; then
        log_info "Deploy to $HOST completed successfully."
    else
        log_error "Failed to deploy to $HOST."
    fi

    echo "--------------------------------------------------"
done

log_info "****** Deploy tasks completed successfully ******"
