sudo apt-get -y install python-pip python-virtualenv
sudo pip install --upgrade pip
sudo pip install --upgrade virtualenv
sudo apt-get update
sudo apt-get -y install libpq-dev python-dev

cd /vagrant
sudo pip install -r requirements.txt

sudo chmod a+x -R /usr/local/lib/python2.7/dist-packages/