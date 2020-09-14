#/bin/sh

cat <<EOT >> /home/bitnami/.bash_profile
> alias set_permission="sh /home/bitnami/windows-git-configs/permissions.sh "
> alias get_app="cd /opt/bitnami/apps"
> EOT

source /home/bitnami/.bash_profile
