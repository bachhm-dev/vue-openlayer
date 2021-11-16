#!/usr/bin/env bash

mkdir ~/.aws || true \
&& cp /app/buildkite-secrets/credentials ~/.aws/credentials

npm run build \
&& aws s3 cp dist s3://test-bachhm/ --recursive
