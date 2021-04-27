#nano script.sh
#chmod +x script.sh
#./script.sh
#or
#sh script.sh
#or
#bash script.sh

#!/bin/bash
RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"
echo -e "step 1: ${GREEN}update apt cache${NOCOLOR}"
#sudo apt-get update
echo
echo -e "step 2: ${GREEN}upgrade packages${NOCOLOR}"
#sudo apt-get upgrade
echo
echo -e "step 3: ${GREEN}remove unused packages${NOCOLOR}"
#sudo apt-get --purge autoremove
echo
echo -e "step 4: ${GREEN}clean up${NOCOLOR}"
#sudo apt-get autoclean
echo
if [ -f /var/run/reboot-required ]; then
    echo -e $GREEN 'Reboot required!' $NOCOLOR
fi
echo -e $GREEN "Superset" $NOCOLOR
#sudo apt-get install -y python3-pip
#sudo apt-get install -y python3-venv
echo
#sudo apt -y install gcc g++ make
#sudo apt-get install -y build-essential libssl-dev libffi-dev python3-dev python3-pip libsasl2-dev libldap2-dev
#sudo apt-get install -y python3-dev default-libmysqlclient-dev
echo
echo -e $GREEN "install nodejs" $NOCOLOR
#curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
#sudo apt -y install nodejs
node --version
npm --version
echo -e $GREEN "install yarn" $NOCOLOR
#curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - 
#echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
#sudo apt update && sudo apt install -y yarn
yarn --version
echo
echo -e $GREEN "clone superset" $NOCOLOR
#git clone https://github.com/apache/superset.git
git clone https://github.com/prakritisamanta/datadecade
cd datadecade/
#cd superset/
python3 -m venv venv1
source venv1/bin/activate
pip install -r requirements/development.txt
pip install -e .
#python setup.py install
cd superset-frontend
yarn
npm run build
superset run
echo "done"