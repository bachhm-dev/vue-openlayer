#!/usr/bin/env bash

mkdir -p ~/.aws || true \
  && cp .buildkite/secrets/credentials ~/.aws/credentials

mkdir for_upload \
  && aws s3 cp s3://bachhm-build-artifacts/${1}/${FOLDER} for_upload --recursive --profile devopsBucketAccess \
  && aws s3 cp for_upload s3://bachhm-test --recursive --profile eventhub \
  && aws s3 rm s3://bachhm-build-artifacts/${1}/${FOLDER} --recursive --profile devopsBucketAccess