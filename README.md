
```
├── terraform/
│   ├── main.tf               # Terraform configuration for EKS cluster
│   ├── variables.tf          # Input variables for Terraform 
│   ├── outputs.tf            # Output variables from Terraform  
│   └── provider.tf           # Provider configuration (AWS, etc.)
│
├── packer/
│   ├── uvicorn-image.json    # Packer template for building a Uvicorn web app image
│   └── scripts/
│       └── install_app.sh    # Script to install Uvicorn app dependencies
│ 
├── ansible/
│   ├── playbook.yaml         # Ansible playbook to deploy Uvicorn app on EC2 instances
│   └── roles/
│       └── uvicorn/
│           ├── tasks/        # Tasks for Uvicorn deployment
│           │   └── main.yaml
│           └── templates/    # Config templates (e.g., service files)
│               └── uvicorn.service.j2
│
└── README.md                 # Project documentation
```


This repository contains configurations for deploying an Amazon EKS (Elastic Kubernetes Service) cluster and setting up a Uvicorn application using Ansible and Terraform. The repository is organized into three main directories:

    terraform/: Contains Terraform configurations for provisioning the EKS cluster.
    packer/: Includes Packer templates for building a Uvicorn web application image.
    ansible/: Holds Ansible playbooks and roles for deploying the Uvicorn application on EC2 instances.


# Validate Terraform syntax 
terraform validate
terraform plan

# Validate Packer configuration
packer validate uvicorn-image.json

# Validate Ansible Playbook
ansible-lint
