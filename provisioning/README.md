# Running Vagrant:

Run the following command to start the controller node and two worker nodes
```bash
vagrant up
```

The nodes should now be active on the following IP addresses:
- controller : 192.168.56.10 
- node1 : 192.168.56.11 
- node2 : 192.168.56.12 

## Testing:

You can test a connection to each node using the inventory.cfg.
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