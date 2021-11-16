npm run build
&& aws s3 cp dist s3://bachhm-build-artifacts/ --recursive
