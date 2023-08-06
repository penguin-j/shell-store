#!/bin/bash

IDENTITY_EMAIL_ADDRESS=${1}

### 1. Email Identity作成 ###
sh ../create-email-identity.sh ${IDENTITY_EMAIL_ADDRESS}

### 2. Identity作成の認証 ###
# メールに届いたリンクをクリック

### 3. テストメールを自分に送信 ###

# IDが有効化されるまで待機する
aws ses wait identity-exists \
    --identities ${IDENTITY_EMAIL_ADDRESS}

sh aws/sesv2/send-test-email.sh ${IDENTITY_EMAIL_ADDRESS} ${IDENTITY_EMAIL_ADDRESS}