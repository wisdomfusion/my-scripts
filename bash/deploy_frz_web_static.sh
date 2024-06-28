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

cd /data/git_repos/freezing

echo "Pulling code from git repository ..."
git reset --hard && git clean -f && git pull && git checkout master || {
    log_error "Failed to pull code from git repository"
    exit 1
}

echo "Syncing web static assets ..."
rsync -a /data/git_repos/freezing/src/main/webapp/templates/default/ /data/www/freezing/templates/default/
rsync -a /data/git_repos/freezing/src/main/webapp/templates/default/skin/ /data/www/freezing/published/default/skin/
rsync -a /data/git_repos/freezing/src/main/webapp/templates/default/z/ /data/www/freezing/published/default/z/

echo "Change file chown attr."
chown -R tomcat:tomcat /data/www/freezing/templates/default/
chown -R tomcat:tomcat /data/www/freezing/published/default/skin/
chown -R tomcat:tomcat /data/www/freezing/published/default/z/

log_info "****** Deploy tasks completed successfully ******"
