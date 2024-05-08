#!/bin/bash

terraform init -upgrade

terraform plan -out main.tfplan

terraform apply main.tfplan

terraform output -raw key_data > key.pem

chmod 600 key.pem
