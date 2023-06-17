#!/bin/bash

INSTANCE_ID=${1}
SECURITY_GROUP_ID=${2}
DB_SUBNET_GROUP_NAME=${INSTANCE_ID}-subnet-group

aws rds delete-db-instance \
    --db-instance-identifier ${INSTANCE_ID} \
    --skip-final-snapshot

# DBインスタンス削除が完了しないと次に進めないのでsleepする
sleep 5m

aws ec2 delete-security-group --group-id ${SECURITY_GROUP_ID}

aws rds delete-db-subnet-group --db-subnet-group-name ${DB_SUBNET_GROUP_NAME}