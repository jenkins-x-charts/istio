#!/bin/bash

echo "promoting the new version ${VERSION} to downstream repositories"

jx step create pr regex \
    --regex 'version: (.*)' \
    --version ${VERSION} \
    --files charts/jx-labs/istio.yml \
    --repo https://github.com/jenkins-x-labs/jenkins-x-versions.git
