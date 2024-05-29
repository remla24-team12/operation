# Running the application using docker-compose
To run the applications, simply run docker-compose up

# Running the application using kubernetes
## Generate an ssh key
To generate an ssh key, run the following command:
```bash
ssh-keygen 
```

Save the key to ```provisioning/keys/vagrant_ssh_key``` and ```provisioning/keys/vagrant_ssh_key.pub```


## Install ansible, vagrant and virtualbox
To install ansible, vagrant and virtualbox, run the following commands:
```bash
sudo apt-get install ansible
sudo apt-get install vagrant
sudo apt-get install virtualbox
```

# Running the application
To run the application, simply run the following command:
```bash
vagrant up
```

## Initializing kubernetes
To initialize kubernetes, run the following command:
```bash
ansible-playbook -i provisioning/hosts provisioning/playbooks/init-cluster.yml
```

# Links to other repositories:
For creating our application we decided to stick to the architecture proposed in the assignment:
![](/assets/architecture.png)

You can find the repositories for the respective components here:
- app (frontend & service): https://github.com/remla24-team12/app
- lib-version: https://github.com/remla24-team12/lib-version 

- model-service: https://github.com/remla24-team12/model-service  
- model-training (A1): https://github.com/remla24-team12/model-training
- lib-ml: https://github.com/remla24-team12/lib-ml 


## Comments for A1:
Here you can find the tag: [A1](https://github.com/killB0x/remla24-team12/releases/tag/A1). The corresponding repository contains a README file explaining how to run the project. 

We would be very happy to receive feeback on the following tasks:
  - Overall folder structure
  - Chosing pipenv as a dependency manager
  - The dvc pipeline (e.g. if the stages make sense)
  - Chosing dslinter for code quality
