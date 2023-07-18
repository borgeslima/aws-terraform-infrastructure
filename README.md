## Infrastructure as Code AWS-Driven


Infrastructure as code, also referred to as IaC, is an IT practice that codifies and manages underlying IT infrastructure as software. The purpose of infrastructure as code is to enable developers or operations teams to automatically manage, monitor and provision resources, rather than manually configure discrete hardware devices and operating systems. Infrastructure as code is sometimes referred to as programmable or software-defined infrastructure.


# #

[![License](https://img.shields.io/badge/License-UNLISENSED-silver.svg?style=flat)](https://github.com/clips/pattern/blob/master/LICENSE.txt) 
[![License](https://img.shields.io/badge/Terraform-v1.5.0-purple.svg?style=flat)](https://github.com/clips/pattern/blob/master/LICENSE.txt) 
[![License](https://img.shields.io/badge/AWS_CLI-v1.22.43-yellow.svg?style=flat)](https://github.com/clips/pattern/blob/master/LICENSE.txt)
[![License](https://img.shields.io/badge/TerraGrunt-v1.5.0-blue.svg?style=flat)](https://github.com/clips/pattern/blob/master/LICENSE.txt)

# #

# Requirements

- AWS CLI (config aws credentials)
- Terraform CLI
- Terragrunt CLI

# AWS-driven IAC review

- VPC   
    - nat gateway
    - route tables
    - azs
    - subnets
        - public subnets
        - private subnets
- EKS
    - management nodes
        - spot
        - on_demand


# How to start project

Replace <env> whit your environment.

```sh
$ terragrunt init 
```

```sh
$ terragrunt plan 
```

```sh
$ terragrunt apply 
```


Get the EKS Context


```sh
aws eks --region $REGION update-kubeconfig --name $EKS_NAME
```

# Modules
- aws
    - vpc
    - eks
    - kms
- hashcop
    - random
    - helm
