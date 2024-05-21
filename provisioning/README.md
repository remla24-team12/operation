# Running Vagrant:

Run the following command to start the controller node and two worker nodes
```bash
vagrant up
```

The nodes should now be active on the following IP addresses:
- controller : 192.168.56.10 
- node1 : 192.168.56.11 
- node2 : 192.168.56.12

## Ansible:

In order to use Ansible you must navigate to the correct folder:
```bash
cd ansible/
```

For devs, here you can find info about roles:
https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_reuse_roles.html 

## Testing:

You can now test a connection to each node using the inventory.cfg.
First run:
```bash
ssh -i ./keys/vagrant_ssh_key vagrant@192.168.56.10
ssh -i ./keys/vagrant_ssh_key vagrant@192.168.56.11
ssh -i ./keys/vagrant_ssh_key vagrant@192.168.56.12
```

Then:
```bash
ansible test -m ping
```