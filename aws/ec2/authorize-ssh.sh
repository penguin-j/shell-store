#!/bin/bash

SECURITY_GROUP_ID=${1}

aws ec2 authorize-security-group-ingress --group-id ${SECURITY_GROUP_ID} --protocol tcp --port 22 --cidr 0.0.0.0/0