#!/bin/bash

SERVER_IP=${1}
KEY_PATH=${2}

# Java corretto17インストール
COMMAND_INSTALL_JAVA="sudo yum install java-17-amazon-corretto-headless -y && java --version"

ssh -i ${KEY_PATH} ec2-user@${SERVER_IP} -t ${COMMAND_INSTALL_JAVA}