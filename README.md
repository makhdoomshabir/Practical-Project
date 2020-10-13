# QAC SFIA2 Project

## Brief

Deploy flask application and automate in the most efficient way possible, making use of Terraform, Ansible, Kubernetes, Jenkins, Docker, and Docker-Compose as well as a managed database solution using Amazon Web Servers.

### Moscow Prioritisation

Must be:

- Deployed to a test VM
- Deployed in a Kubernetes Cluster
- Connected to an RDS
- Making use of a Jenkins pipeline
- Making use of Ansible and Terraform to speed up automation

Should be:
- Using nginx as a reverse proxy
- Have pipeline job connected to github via webhook
- Hiding all sensitive information (as environment variables)
- Storing a coverage report in testing environment

Could be:
- Using Ansible to configure test VM
- Using Terraform to load up testVM
- Using terraform to load up kubernetes cluster

Won't be:
- Making use of S3 buckets
- Storing any further data within the databases


## Application

The application is a Flask application utilising a frontend, a backend, and a temporary database used until the RDS is configured.

The application works by:
1. The frontend service making a GET request to the backend service. 
2. The backend service using a database connection to query the database and return a result.
3. The frontend service serving up a simple HTML (`index.html`) to display the result.

![app-diagram](https://i.imgur.com/wnbDazy.png)


## CI Pipeline

Project MVP: 

* TF builds jenkins EC2 instance and two RDS's on AWS
* Ansible configures jenkins VM 
* Jenkins pipeline job runs docker containers on second VM
* Jenkins runs Kubernetes pods
* Test VM and Kubernetes cluster connected to an RDS each

![mvp-diagram](https://i.imgur.com/i5qfOas.png)

Project stretch goals:

* TF builds test VM
* Ansible configures test VM
* TF manages Kubernetes cluster

![stretch-diagram](https://i.imgur.com/Q5zljVl.png)

### Risk Assessment

Demonstrates some of the risks that must be considered prior to the application being deployed:

![risk-assessment](https://github.com/makhdoomshabir/Practical-Project/blob/master/documentation/risk%20assessment.png)

### Jira Board Sprints

![sprint-one](https://github.com/makhdoomshabir/Practical-Project/blob/master/documentation/D.S.1.png)

![sprint-two](https://github.com/makhdoomshabir/Practical-Project/blob/master/documentation/D.S.2.png)

![sprint-three](https://github.com/makhdoomshabir/Practical-Project/blob/master/documentation/D.S.3.png)

![sprint-four](https://github.com/makhdoomshabir/Practical-Project/blob/master/documentation/D.S.4.png)

![sprint-five](https://github.com/makhdoomshabir/Practical-Project/blob/master/documentation/D.S.5.png)

![sprint-six](https://github.com/makhdoomshabir/Practical-Project/blob/master/documentation/D.S.6.png)

### Deploying The Application

1. Spin up the two VM's and RDS's from each directory in terraform using: 
* terraform init
* terraform plan
* terraform apply
2. Configure ansible in ansible directory using:
* ansible-playbook -i inventory playbook.yml
3. Load up jenkins server and build pipeline job
4. Check public IP address of testing VM as well as production VM to ensure both are deployed

### Current Bug(s)

* Unable to connect kubernetes cluster to RDS meaning docker must be used for the time being

### Author

Makhdoom Shabir 

