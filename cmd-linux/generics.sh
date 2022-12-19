#print second colunm
awk {'print $2'} #Select data from the second colunm

cat /proc/1/cmdline #get the process running with PID 1

export KUBECONFIG=$PWD/kubeconfig #Activate a configfile to kubectl

sed -i 's/oldword/newword/' file.txt #change all inserts in a file

sed -n '/^string/d' file.txt #Delete a line that have the string

sed -i '/^$/d' file.txt #Delete blank lines

ssh-copy-id -i $HOME/.ssh/id_rsa.pub user@192.168.0.1 #copy ssh key to host