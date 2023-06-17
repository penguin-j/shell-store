#!/bin/bash

KEY_NAME=${1}
SECURITY_GROUP_ID=${2}

aws ec2 run-instances \
    --image-id ami-0f9816f78187c68fb \
    --count 1 \
    --instance-type t2.micro \
    --key-name ${KEY_NAME} \
    --security-group-ids ${SECURITY_GROUP_ID} \
    --associate-public-ip-address