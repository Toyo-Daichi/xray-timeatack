#!/bin/bash
# Created on 2022.04.11

echo 'Prepared $chalice new-project function_name'
#
chome=${HOME}/Terminal/xray
export AWS_ACCOUNT_ID=`aws sts get-caller-identity | jq '.Account' | sed 's/"//g' `

#----------------------------------------------------------------------
# +++ Set configure
#----------------------------------------------------------------------
sysname='xray'
type='api-lambda-db'
app_name=${sysname}-${type}
config=${chome}/${type}/.chalice/config.json
stage='dev'
status=' update' # 'create' or 'update'

cat << EOF > ${config}
{
  "version": "2.0",
  "app_name": "${app_name}",
  "stages": {
    "${stage}": {
      "manage_iam_role": false,
      "iam_role_arn": "arn:aws:iam::${AWS_ACCOUNT_ID}:role/lambda_basic_execution",
      "lambda_timeout": 15,
      "xray": true
    }
  }
}
EOF

#----------------------------------------------------------------------
# +++ Execution
#----------------------------------------------------------------------
cd ${chome}/${type}
if [ ${status} == 'create' ]; then
  pip install -r requirements.txt
fi
#
chalice deploy --stage ${stage}

echo 'Normal END'

exit