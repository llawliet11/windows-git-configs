#/bin/sh

app=${1:-target}

sudo chown -R bitnami:daemon /opt/bitnami/apps/$app/htdocs
sudo chown -R bitnami:daemon /opt/bitnami/apps/$app/htdocs/wp-content

sudo find /opt/bitnami/apps/$app/htdocs -type d -exec chmod 775 {} \;
sudo find /opt/bitnami/apps/$app/htdocs -type f -exec chmod 0664 {} \;

sudo chmod -R g+w /opt/bitnami/apps/$app/htdocs/wp-content

#sudo /opt/bitnami/ctlscript.sh restart apache
