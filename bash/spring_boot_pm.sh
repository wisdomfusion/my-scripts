#!/usr/bin/env bash
#
# Startup script for a spring boot project
#
# chkconfig: - 84 16
# description: spring boot project

# 处理命名参数
while getopts ":n:e:h:" opt; do
    case ${opt} in
    n) APP_NAME="$OPTARG" ;;
    e) DEPLOY_ENV="$OPTARG" ;;
    h) NACOS_HOST="$OPTARG" ;;
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
if [[ -z "$APP_NAME" ]]; then
    echo "Usage: $0 -n <APP_NAME> -e <DEPLOY_ENV> -h <NACOS_HOST> [start|stop|restart|status]" >&2
    exit 1
fi

APP_DIR="/data/artifacts/${APP_NAME}"
APP_JAR="battleship-${APP_NAME}-1.0-SNAPSHOT.jar"
APP_CONF="--spring.profiles.active=${DEPLOY_ENV} --spring.cloud.nacos.discovery.server-addr=${NACOS_HOST} --spring.cloud.nacos.config.server-addr=${NACOS_HOST}"

cd $APP_DIR

started() {
    PID=$(ps -ef | grep "${APP_JAR}" | grep -v grep | awk '{print $2}')

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
        echo "${APP_NAME} is already running, pid ${PID}"
    else
        nohup java -Xmx512m -Xms512m -jar ${APP_JAR} ${APP_CONF} > /dev/null 2>&1 &
        echo "${APP_NAME} started successfully"
    fi
}

stop() {
    started

    if [ $? -eq "0" ]; then
        kill -9 $PID
    else
        echo "${APP_NAME} is NOT running"
    fi
}

status() {
    started

    if [ $? -eq "0" ]; then
        echo "${APP_NAME} is running, pid is ${PID}"
    else
        echo "${APP_NAME} is NOT running"
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
