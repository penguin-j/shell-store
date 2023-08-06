#!/bin/bash

### 本番稼働リクエスト（サンドボック解除） ###

WEB_SITE_URL=${1}
USE_CASE_DESCRIPTION=${2}
ADDITIONAL_CONTACT_EMAIL_ADDRESS=${3}

aws sesv2 put-account-details \
--production-access-enabled \
--mail-type TRANSACTIONAL \
--website-url ${WEB_SITE_URL} \
--use-case-description ${USE_CASE_DESCRIPTION} \
--additional-contact-email-addresses ${ADDITIONAL_CONTACT_EMAIL_ADDRESS} \
--contact-language JA