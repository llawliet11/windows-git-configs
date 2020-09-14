#!/bin/bash

cat <<EOT>> /home/bitnami/.bash_profile
PATH="/opt/bitnami/apps/wordpress/bin:/opt/bitnami/varnish/bin:/opt/bitnami/sqlite/bin:/opt/bitnami/php/bin:/opt/bitnami/mysql/bin:/opt/bitnami/letsencrypt/:/opt/bitnami/apache2/bin:/opt/bitnami/common/bin:$PATH"
BITNAMI_ROOT="/opt/bitnami"
export BITNAMI_ROOT

alias set_permission="sh /home/bitnami/windows-git-configs/permissions.sh "
alias get_app="cd /opt/bitnami/apps"
alias get_large_files="find . -printf '%s %p\n'| sort -nr | head -20"
EOT

. /home/bitnami/.bash_profile
