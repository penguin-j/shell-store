#!/bin/bash

### 01_create-email-identity.sh が完了してから実行する ###

WEB_SITE_URL=${1}
USE_CASE_DESCRIPTION=${2}
ADDITIONAL_CONTACT_EMAIL_ADDRESS=${3}
FROM_ADDRESS=${4}
TO_ADDRESSES=${5}

### 4. サンドボックス解除 ###
sh aws/sesv2/request-production-access.sh ${WEB_SITE_URL} ${USE_CASE_DESCRIPTION} ${ADDITIONAL_CONTACT_EMAIL_ADDRESS}

### 5. テストメールを自分以外のメールアドレスに送信 ###
sh aws/sesv2/send-test-email.sh ${FROM_ADDRESS} ${TO_ADDRESSES}