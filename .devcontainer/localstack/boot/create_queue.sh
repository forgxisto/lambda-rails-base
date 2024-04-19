#!/bin/bash

queue_name="default"
lambda_file_path="/opt/localstack_boot_files/lambdakiq_proxy.zip"

# SQSキューの作成
awslocal sqs create-queue --queue-name $queue_name

# キューURLの取得
queue_url=$(awslocal sqs get-queue-url --queue-name $queue_name --output text)

# キューARNの取得
queue_arn=$(awslocal sqs get-queue-attributes --queue-url $queue_url --attribute-names QueueArn --query Attributes.QueueArn --output text)

# Lambda関数のデプロイ
awslocal lambda create-function --function-name lambdakiq_proxy \
    --zip-file fileb://$lambda_file_path --handler index.handler \
    --runtime nodejs20.x --role arn:aws:iam::000000000000:role/lambda-ex

# SQSをLambdaのトリガーとして設定
awslocal lambda create-event-source-mapping \
    --function-name lambdakiq_proxy --batch-size 10 \
    --event-source-arn $queue_arn
