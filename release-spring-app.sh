#!/bin/bash

### ./gradlewのあるディレクトリで実行する ###

EXECUTABLE_JAR_NAME=${1}
SERVER_IP=${2}
KEY_PATH=${3}

# Executable Jar生成
./gradlew bootJar

# 生成したExecutable JarをSCPでサーバーに転送
scp -i ${KEY_PATH} ./build/libs/${EXECUTABLE_JAR_NAME} ec2-user@${SERVER_IP}:~/

# SSH接続して、Springアプリケーションを実行する
ssh -i ${KEY_PATH} ec2-user@${SERVER_IP} -t java -jar ${EXECUTABLE_JAR_NAME}

# FIXME: 帰ってこれない
exit