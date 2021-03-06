#!/bin/bash

sudo yum -y install glibc-static git unzip
git config --global url.https://github.com/.insteadOf git://github.com/

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash

echo "source /home/vagrant/.nvm/nvm.sh" >> /home/vagrant/.profile
source /home/vagrant/.profile

nvm install 4.4.4
nvm alias default 4.4.4
	
git clone https://github.com/c9/core.git /home/vagrant/c9sdk
cd /home/vagrant/c9sdk
./scripts/install-sdk.sh
curl -L https://raw.githubusercontent.com/c9/install/master/install.sh | bash
sudo cp /vagrant/c9sdk.service /lib/systemd/system/c9sdk.service
sudo chmod 644 /lib/systemd/system/c9sdk.service
sudo systemctl daemon-reload
sudo systemctl enable c9sdk
sudo systemctl start c9sdk

curl https://install.meteor.com/ | sh
git clone https://github.com/nakata0705/meteor-react-redux-boilerplate.git /home/vagrant/my-killer-app
cd /home/vagrant/my-killer-app/.client
npm install
npm install material-ui dhtmlx-gantt

mkdir -p /home/vagrant/my-killer-app/public/dhtmlxGantt
curl -L -o /home/vagrant/my-killer-app/public/dhtmlxGantt/dhtmlxGantt.zip -O http://dhtmlx.com/x/download/regular/dhtmlxGantt.zip
cd /home/vagrant/my-killer-app/public/dhtmlxGantt
unzip dhtmlxGantt.zip
