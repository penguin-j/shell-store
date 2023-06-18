#!/bin/bash

SECURITY_GROUP_NAME=${1}
VPC_ID=${2}

aws ec2 create-security-group \
    --group-name ${SECURITY_GROUP_NAME} \
    --description ${SECURITY_GROUP_NAME} \
    --vpc-id ${VPC_ID}