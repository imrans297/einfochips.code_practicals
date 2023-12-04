#/bin/bash
sudo apt-get update && sleep 5;
sudo apt-get install -y software-properties-common;
sudo apt-add-repository --yes --upgrade ppa:ansible/ansible;
sudo apt-get update;
sudo apt-get install ansible -y;
sleep 3;

echo "ansible Installed Successfully"

echo "running Playbook"
ansible-playbook -u ubuntu /home/ubuntu/playbook.yml -b