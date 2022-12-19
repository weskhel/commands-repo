#Basic
ansible 192.168.0.1 -i /path/to/hosts -m ping -u user --ask-pass -b -K
ansible 192.168.0.1 -i /path/to/hosts -m 'raw apt update' -u user --ask-pass -b -K


ssh-keygen -t rsa -f ~/.ssh/ansible-user_rsa -C "ansible@user" -q -N ""
ssh-copy-id -i ~/.ssh/ansible-user_rsa.pub user@192.168.0.1
ssh -i ~/.ssh/ansible-user_rsa user@192.168.0.1

#Manipulate sudoers file to allow user to sudo without passowd
ansible 192.168.250.101 -i /path/to/hosts --private-key=~/.ssh/ansible-user_rsa -m "lineinfile dest=/etc/sudoers state=present regexp='^%sudo' line='%sudo ALL=(ALL) NOPASSWD: ALL'" -u user -b -K
ansible 192.168.250.101 -i /path/to/hosts --private-key=~/.ssh/ansible-user_rsa -m ping -u user -b
ansible 192.168.250.101 -i /path/to/hosts --private-key=~/.ssh/ansible-user_rsa -m 'shell grep -v ^#  /etc/sudoers |grep sudo' -u user -b

