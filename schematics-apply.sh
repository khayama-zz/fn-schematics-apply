#!/bin/bash
read ARGS
IBMCLOUD_API_KEY=`echo "$ARGS" | jq -r '."IBMCLOUD_API_KEY"'`
WORKSPACE_ID=`echo "$ARGS" | jq -r '."WORKSPACE_ID"'`
ibmcloud login -a cloud.ibm.com -r jp-tok -g Default --apikey $IBMCLOUD_API_KEY
ACTIVITY_ID=`ibmcloud terraform apply --force --json --id $WORKSPACE_ID | grep activityid | awk '{print $2}' | sed "s/\"//g"`
echo "{ \"message\": \"Applied, Your Activity ID is $ACTIVITY_ID.\" }"
