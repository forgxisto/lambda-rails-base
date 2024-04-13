# frozen_string_literal: true

require 'aws-sdk-s3'

if Rails.env.development?
  Aws.config.update(
    access_key_id: 'test',
    secret_access_key: 'test',
    region: 'us-east-1',
    endpoint: 'https://localhost.localstack.cloud:4566',
    sqs: {
      endpoint: 'https://sqs.localhost.localstack.cloud:4566'
    },
    s3: {
      endpoint: 'https://s3.localhost.localstack.cloud:4566'
    }
  )
end
