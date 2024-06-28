#!/usr/bin/env bash

# 脚本所在目录
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
# 脚本执行日志
LOG_FILE="${SCRIPT_DIR}/build_logs"

log_error() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] [ERROR] $1" >>"$LOG_FILE"
    echo "[ERROR] $1"
}

log_info() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] [INFO] $1" >>"$LOG_FILE"
    echo "[INFO] $1"
}

cd /data/git_repos/ucenter

echo "Pulling code from git repository ..."
git reset --hard && git clean -f && git pull && git checkout master || {
    log_error "Failed to pull code from git repository"
    exit 1
}

echo "Syncing web static assets..."

rsync -a /data/git_repos/ucenter/WebRoot/WEB-INF/views/* /data/www/ucenter/WEB-INF/views/
chown -R tomcat:tomcat /data/www/ucenter/WEB-INF/views/

rsync -a /data/git_repos/ucenter/WebRoot/WEB-INF/layouts/* /data/www/ucenter/WEB-INF/layouts/
chown -R tomcat:tomcat /data/www/ucenter/WEB-INF/layouts/

rsync -a /data/git_repos/ucenter/WebRoot/static/ /data/www/ucenter/static/
chown -R tomcat:tomcat /data/www/ucenter/static/

ssh root@172.17.96.174 <<EOF
rsync -a root@172.17.96.173::ucenter/WEB-INF/views/ /data/www/ucenter/WEB-INF/views/
chown -R tomcat:tomcat /data/www/ucenter/WEB-INF/views/

rsync -a root@172.17.96.173::ucenter/WEB-INF/layouts/ /data/www/ucenter/WEB-INF/layouts/
chown -R tomcat:tomcat /data/www/ucenter/WEB-INF/layouts/

rsync -a root@172.17.96.173::ucenter/static/ /data/www/ucenter/static/
chown -R tomcat:tomcat /data/www/ucenter/static/

EOF

log_info "****** Deploy tasks completed successfully ******"
