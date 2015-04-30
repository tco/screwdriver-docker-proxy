#!/usr/bin/env bash

git archive --format=zip HEAD > screwdriver-proxy-latest.zip

aws s3 cp screwdriver-proxy-latest.zip s3://screwdriver-docker/screwdriver-proxy/ --profile screwdriver

rm screwdriver-proxy-latest.zip
