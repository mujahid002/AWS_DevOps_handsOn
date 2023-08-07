#!/usr/bin/bash

####################

#Author: mujahid002
#Date: 7th Aug 2023

#version: v1

#This script will report and track the AWS resources like EC2, S3, Lambda Functions, IAM Users.
#######################

set -x

#List AWS EC2 Instances
echo "all ec2 instancs"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> awsResourceTracker

#AWS S3
echo "all s3 buckets"
aws s3 ls >> awsResourceTracker

#AWS Lambda Functions
echo "all lambda functions"
aws lambda list-functions | jq '.Functions[].FunctionName' >> awsResourceTracker

#AWS IAM Users
echo "all iam users"
aws iam list-users | jq '.Users[].UserId' >> awsResourceTracker

