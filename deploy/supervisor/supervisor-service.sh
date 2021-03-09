#!/bin/bash
if [[ `uname` == 'Linux' ]]; then
d="/var/log/celery"
cp /var/www/helios-server/deploy/supervisor/celery-worker.conf /etc/supervisor/conf.d/
[ -d "${d}" ] &&  echo "Directory $d found." ||  mkdir /var/log/celery/
sudo chmod 777 /var/log/celery/
sudo chmod 777 /var/www/helios-server/.env
sudo service supervisor start
supervisorctl reread
supervisorctl update
sudo supervisorctl start athens:*
sudo supervisorctl restart athens:*
sudo supervisorctl status
fi
