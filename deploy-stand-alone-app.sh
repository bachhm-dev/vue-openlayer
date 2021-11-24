#!/usr/bin/env bash

mkdir -p ~/.aws || true \
  && cp .buildkite/secrets/credentials ~/.aws/credentials

mkdir for_upload \
  && aws s3 cp s3://bachhm-build-artifacts/${1}/${FOLDER} for_upload --recursive \
  && aws s3 cp for_upload s3://test-bachhm --recursive \
  && aws s3 rm s3://bachhm-build-artifacts/${1}/${FOLDER} --recursive