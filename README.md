Terraform execution

   46  terraform init
   47  terraform fmt
   48  terraform validate
   49  terraform plan
   50  terraform apply
       terraform destroy

Script execution
#chmod +x scripts/generate_inventory.sh
#./generate_inventory.sh

Ansible execution
#cd ansible

test root ssh
#ansible all -m ping

Run bootstrap/common role first
#ansible-playbook site.yml

create devops user
configure sudo
configure SSH key auth
disable password auth
disable root SSH login.

-------

For bootstrap phase only, temporarily override user during execution:
ansible-playbook site.yml -u root

test sudo:
#ansible all -m command -a "whoami" -b

