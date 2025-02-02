#!/bin/bash

apt update
apt -y install gnupg2 wget
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" | tee  /etc/apt/sources.list.d/pgdg.list
apt update
apt -y install postgresql-11
#wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.stretch_amd64.deb
apt install ./wkhtmltox_0.12.5-1.stretch_amd64.deb
wkhtmltopdf --version
wget -O - https://nightly.odoo.com/odoo.key | apt-key add -
echo "deb http://nightly.odoo.com/13.0/nightly/deb/ ./" | tee /etc/apt/sources.list.d/odoo.list
apt update
apt install odoo
systemctl enable --now odoo
