# Running the application using docker-compose
To run the applications, simply run docker-compose up
Note: It might take a while for all containers to boot up

# Running the application using kubernetes
## Generate an ssh key
To generate an ssh key, run the following command:
```bash
ssh-keygen 
```

Save the key to ```/provisioning/keys/vagrant_ssh_key``` and ```/provisioning/keys/vagrant_ssh_key.pub```


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
cd provisioning
vagrant up
```

## Initializing kubernetes
To initialize kubernetes, run the following command:
```bash
sudo ansible-playbook -i /inventory/hosts /playbooks/init-cluster.yml
```

## Set kubectl context
To set the kubectl context, run the following command:
```bash
export KUBECONFIG=/tmp/.kube/config
```

## Install istio
To install istio, run the following command:
```bash
ansible-playbook -i provisioning/hosts provisioning/playbooks/install-istio.yml
```

## Install dashboard, prometheus, grafana
To install dashboard, prometheus, grafana, run the following command:
```bash
ansible-playbook -i provisioning/hosts provisioning/playbooks/install-helm.yml
```

## Run helm deployment
There are two different scripts for deployment: remla-ingress and remla-istio.
If istio has been installed run:
```bash
ansible-playbook -i provisioning/hosts provisioning/playbooks/deploy-helm-chart-istio.yml
```
otherwise run:
```bash
ansible-playbook -i provisioning/hosts provisioning/playbooks/deploy-helm-chart-ingress.yml
```
# Accessing dashboards
Grafana:    192.168.56.10:30300
Prometheus: 192.168.56.10:30090
K3s:        192.168.56.10/dashboard

# Adding grafana dashboard
1. Go to 192.168.56.10:30300
2. Add prometheus as a new source by setting the address 192.168.56.10:30090
3. Go to dashboards and select import. Select the file located at /provisioning/grafana/grafana_dashboard.json

# Entering the controller node
To ssh into the controler node run:
```bash
sudo vagrant ssh controller-1
```
# Rate limiting test
You can run /provisioning/rate_limiting_test.sh to test whether the rate limiter is working.

# Ingress paths
The following paths can be used when running ingress:
Frontend app:  192.168.56.10/frontend/
Backend app:   192.168.56.10/backend/
Model service: 192.168.56.10/model/

# Istio paths
The following paths can be used when running istio:
Frontend app:  192.168.56.10/app
Backend app:   192.168.56.10/api
Model service: 192.168.56.10/model

# Grafana login
To login to Grafana use the following credentials:
username: admin
password: admin

# Note
Some of the docker images we use are quite large, so if the application is not working it might be due to containers being created.
To check whether all pods ar running ssh into the controller and run `kubectl get pods`.

# Links to other repositories:
For creating our application we decided to stick to the architecture proposed in the assignment:
![](/assets/architecture.png)

You can find the repositories for the respective components here:
- app (frontend & service): https://github.com/remla24-team12/app
- lib-version: https://github.com/remla24-team12/lib-version

- model-service: https://github.com/remla24-team12/model-service
- model-training (A1): https://github.com/remla24-team12/model-training
- lib-ml: https://github.com/remla24-team12/lib-ml