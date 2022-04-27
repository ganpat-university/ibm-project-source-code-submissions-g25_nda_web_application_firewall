#!/bin/bash
sudo su
apt update
sudo apt-get install -y python3-dev default-libmysqlclient-dev build-essential
apt install -y python3 python3-pip git docker.io
git clone https://github.com/anilprajapati22/waf-master.git
pip3 install -r waf-master/requirements.txt
pip3 install mysqlclient
rm waf-master/dockergui/settings.py
mv waf-master/dockergui/setting_rds.py waf-master/dockergui/settings.py
sed -i "s/Dbname/sgndb/" waf-master/dockergui/settings.py
sed -i "s/Dbuser/sgnons#0123jkhjamjbm/" waf-master/dockergui/settings.py
sed -i "s/Dbpasswd/sgnroot/" waf-master/dockergui/settings.py
sed -i "s/Dburl/education.cq174vfsoqja.us-east-1.rds.amazonaws.com/" waf-master/dockergui/settings.py
python3 waf-master/manage.py runserver 0:80
