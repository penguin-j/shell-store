#!/bin/bash

SECURITY_GROUP_ID=${1}

aws ec2 delete-security-group --group-id ${SECURITY_GROUP_ID}