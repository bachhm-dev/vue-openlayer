#!/usr/bin/env bash

npm run build \
&& aws s3 cp dist s3://test-bachhm/ --recursive
