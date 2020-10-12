# QAC SFIA2 Project

## Brief

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

![mvp-diagram](https://i.imgur.com/i5qfOas.png)

Project stretch goals:

![stretch-diagram](https://i.imgur.com/Q5zljVl.png)

### Risk Assessment

![risk-assessment](https://github.com/makhdoomshabir/Practical-Project/blob/master/documentation/risk%20assessment.png)

### Jira Board Sprints

![sprint-one](https://github.com/makhdoomshabir/Practical-Project/blob/master/documentation/D.S.1.png)

![sprint-two](https://github.com/makhdoomshabir/Practical-Project/blob/master/documentation/D.S.2.png)

![sprint-three](https://github.com/makhdoomshabir/Practical-Project/blob/master/documentation/D.S.3.png)

![sprint-four](https://github.com/makhdoomshabir/Practical-Project/blob/master/documentation/D.S.4.png)

![sprint-five](https://github.com/makhdoomshabir/Practical-Project/blob/master/documentation/D.S.5.png)

![sprint-six](https://github.com/makhdoomshabir/Practical-Project/blob/master/documentation/D.S.6.png)

### Deploying The Application

1. Spin up the two VM's and RDS's from each directory using 

''' 
terraform init
terraform plan
terraform apply
'''
