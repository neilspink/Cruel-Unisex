# Secure Linux

Helper scripts for setup.

# Ansible Setup

- On workload server:

    ```
    useradd -m -s /bin/bash devops
    echo -e ‘devops\tALL=(ALL)\tNOPASSWD:\tALL’ > /etc/sudoers.d/devops
    su devops
    ssh-keygen -t rsa -b 4096
    cp ~/.ssh/id_rsa.pub ~/.ssh/authorized_keys
    exit
    systemctl restart sshd
    service sshd restart
    ```

- Copy private key to control server.

- On control server:

    ```
    sudo apt update
    sudo apt upgrade -q -y 
    sudo apt install ansible -y    
    ```  
    
- Upload playbook.yml to control server

- Create hosts file on control server.

    ```
    [www]
    10.0.8.8     ansible_ssh_private_key_file=~/devops.pub
    ```

- Running the Ansible.

    Check IP address
    ```
    ansible auditdev -i hosts --list-hosts
    ```

    Check connection
    ```
    ansible -i hosts -u devops -m raw -a 'lsb_release -a' www
    ```

    Run playbook
    ```
    ansible-playbook playbook.yml -u devops -i hosts -l www
    ```
