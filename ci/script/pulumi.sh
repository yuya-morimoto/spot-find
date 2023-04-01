#!/bin/bash

# exit if a command returns a non-zero exit code and also print the commands and their args as they are executed.
set -e -x

# download and install required tools.
# pulumi
curl -L https://get.pulumi.com/ | bash
export PATH=$PATH:$HOME/.pulumi/bin

echo ls

# change directory
cd pulumi

# restore npm dependencies for our infra app.
npm install

# login into pulumi. This will require the PULUMI_ACCESS_TOKEN environment variable.
pulumi login

# select the appropriate stack.
if [[ "$PROJECT_ID" == *dev* ]]; then
    pulumi stack select dev
    elif [[ "$PROJECT_ID" == *stg* ]]; then
    pulumi stack select stg
    elif [[ "$PROJECT_ID" == *prd* ]]; then
    pulumi stack select prd
else
    echo "PROJECT_ID:$PROJECT_ID"
    exit 1
fi

pulumi preview
