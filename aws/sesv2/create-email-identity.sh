#!/bin/bash

EMAIL_ADDRESS=${1}

aws sesv2 create-email-identity \
	--email-identity ${EMAIL_ADDRESS} \
	--region ap-northeast-1