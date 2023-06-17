#!/bin/bash

SECURITY_GROUP_NAME=${1}
DESCRIPTION=${2}

aws ec2 create-security-group --group-name ${SECURITY_GROUP_NAME} --description ${DESCRIPTION}