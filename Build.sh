#!/bin/bash

# Run Terraform
Run_Terraform() {
    echo "Running Terraform..."
    cd /home/abunemr/iVolve/Project/Terraform
    terraform init
    terraform apply -auto-approve
    cd -
    echo "Terraform Completed"
}

# Function to run Ansible
Run_Ansible() {
    echo "Ansible is running"
    cd /home/abunemr/iVolve/Project/Ansible/
    export ANSIBLE_HOST_KEY_CHECKING=False
    ansible-playbook -i inventory/aws_ec2.yml  project_playbook.yml 
    cd -
    echo "Ansible completed"
}



echo "It will start to run all scripts "
Run_Terraform
echo "Terraform Fininshed SuccessFully"
sleep 5
Run_Ansible
echo "Ansible Finished SuccessFully"
echo "All Scripts Finished."