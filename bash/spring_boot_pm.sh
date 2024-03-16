#!/usr/bin/env bash
#
# Startup script for a spring boot project
#
# chkconfig: - 84 16
# description: spring boot project

# 约定：
# 1. 应用名称：battleship-project-service
# 2. 制品名称："${APP_NAME}-1.0-SNAPSHOT.jar"
# 3. 常用目录或路径：
#
# 脚本参数：
# -n 应用名称
# -e 发布环境： prod 生产环境，stage 预发环境
# -h Nacos 部署 host:port
# -j JAVA_OPTS，如 "-Xmx1g -Xms1g" 或 "-Xmx512m -Xms512m"
# eg. /data/artifacts/spring_boot_pm.sh -n "battleship-activity-service" -e stage -h "127.0.0.1:8848" start
#     /data/artifacts/spring_boot_pm.sh -n "battleship-activity-service" -e stage -h "127.0.0.1:8848" -j "-Xmx1g -Xms1g" start

export JAVA_HOME=/opt/jdk1.8.0_401
export PATH=$JAVA_HOME/bin:$PATH

DEFAULT_JAVA_OPTS="-Xmx512m -Xms512m"

# 处理命名参数
while getopts ":n:e:h:j:" opt; do
    case ${opt} in
    n) APP_NAME="$OPTARG" ;;
    e) DEPLOY_ENV="$OPTARG" ;;
    h) NACOS_HOST="$OPTARG" ;;
    j) JAVA_OPTS="$OPTARG" ;;
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
if [[ -z "$APP_NAME" || -z "$DEPLOY_ENV" || -z "$NACOS_HOST" ]]; then
    echo "Usage: $0 -n <APP_NAME> -e <DEPLOY_ENV> -h <NACOS_HOST> -j <JAVA_OPTS> [start|stop|restart|status]" >&2
    exit 1
fi

if [[ -z "$JAVA_OPTS" ]]; then
    JAVA_OPTS=$DEFAULT_JAVA_OPTS
fi

APP_DIR=/data/artifacts/$APP_NAME
cd $APP_DIR
APP_JAR=${APP_NAME}-*.jar
APP_CONF="--spring.profiles.active=${DEPLOY_ENV} --spring.cloud.nacos.discovery.server-addr=${NACOS_HOST} --spring.cloud.nacos.config.server-addr=${NACOS_HOST}"
LOG_FILE="${APP_DIR}/deploy_logs"

log_error() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] [ERROR] ${APP_NAME} $1" >>"$LOG_FILE"
    echo "[ERROR] ${APP_NAME} $1"
}

log_info() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] [INFO] ${APP_NAME} $1" >>"$LOG_FILE"
    echo "[INFO] ${APP_NAME} $1"
}

started() {
    PID=$(ps -ef | grep $APP_JAR | grep -v grep | awk '{print $2}')

    if [ -z "${PID}" ]; then
        return 1
    else
        return 0
    fi
}

#启动方法
start() {
    started

    if [ $? -eq "0" ]; then
        log_info "already running, pid ${PID}"
    else
        nohup java ${JAVA_OPTS} -jar ${APP_JAR} ${APP_CONF} > logs/start.log 2>&1 &
        log_info "started successfully"
    fi
}

stop() {
    started

    if [ $? -eq "0" ]; then
        kill -9 $PID
        log_info "stopped successfully"
    else
        log_info "NOT running"
    fi
}

status() {
    started

    if [ $? -eq "0" ]; then
        log_info "already running, pid ${PID}"
    else
        log_info "NOT running"
    fi
}

restart() {
    stop
    sleep 2
    start
}

case "$1" in
"start")
    start
    ;;
"stop")
    stop
    ;;
"status")
    status
    ;;
"restart")
    restart
    ;;
*)
    usage
    ;;
esac
