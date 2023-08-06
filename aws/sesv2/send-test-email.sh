#!/bin/bash

FROM_ADDRESS=${1}
TO_ADDRESSES=${2}

aws sesv2 send-email \
    --from-email-address ${FROM_ADDRESS} \
    --destination ToAddresses=${TO_ADDRESSES} \
    --content file://aws/sesv2/content.json