#!/bin/bash

POOL_NAME=${1}

aws cognito-idp create-user-pool \
    --cli-input-yaml file://aws/cognito/user-pool.yaml