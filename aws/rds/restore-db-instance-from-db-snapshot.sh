#!/bin/bash

INSTANCE_ID=${1}
SNAPSHOT_ID=${2}
SUBNET_IDS=${3}
VPC_ID=${4}
DB_SUBNET_GROUP_NAME=${INSTANCE_ID}-subnet-group
SECURITY_GROUP_NAME=${INSTANCE_ID}-sg

aws rds create-db-subnet-group \
    --db-subnet-group-name ${DB_SUBNET_GROUP_NAME} \
    --db-subnet-group-description ${INSTANCE_ID}-subnet-group \
    --subnet-ids ${SUBNET_IDS}

SECURITY_GROUP_ID=`aws ec2 create-security-group \
    --group-name ${SECURITY_GROUP_NAME} \
    --description ${SECURITY_GROUP_NAME} \
    --vpc-id ${VPC_ID}`["GroupId"]
aws ec2 authorize-security-group-ingress --group-id ${SECURITY_GROUP_ID} --protocol tcp --port 5432 --cidr 0.0.0.0/0

aws rds restore-db-instance-from-db-snapshot \
    --db-instance-identifier ${INSTANCE_ID} \
    --db-snapshot-identifier ${SNAPSHOT_ID} \
    --no-multi-az \
    --db-instance-class db.t3.micro \
    --storage-type gp2 \
    --db-subnet-group-name ${DB_SUBNET_GROUP_NAME} \
    --vpc-security-group-ids ${SECURITY_GROUP_ID} \
    --no-publicly-accessible