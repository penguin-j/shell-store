#!/bin/bash

KEY_NAME=${1}
SUBNET_ID=${2}
SECURITY_GROUP_ID=${3}

aws ec2 run-instances \
    --image-id ami-0f9816f78187c68fb \
    --count 1 \
    --instance-type t2.micro \
    --key-name ${KEY_NAME} \
    --subnet-id ${SUBNET_ID} \
    --security-group-ids ${SECURITY_GROUP_ID} \
    --associate-public-ip-address