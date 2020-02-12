#!/bin/bash
unset AWS_ACCESS_KEY_ID
unset AWS_SECRET_ACCESS_KEY
unset AWS_SESSION_TOKEN
echo "Enter your MFA Token"
read token
tk=`aws sts assume-role --role-arn "the arn of the role you want to assume" --role-session-name tcci-SIT --serial-number "the arn of your MFA" --token-code $token`

export AWS_ACCESS_KEY_ID=`echo $tk | jq -r '.Credentials.AccessKeyId'`
export AWS_SECRET_ACCESS_KEY=`echo $tk | jq -r '.Credentials.SecretAccessKey'`
export AWS_SESSION_TOKEN=`echo $tk | jq -r '.Credentials.SessionToken'`


