#!/usr/bin/env bash

set -e

ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker build -t amazon-redshift-utils $ROOT_DIR
docker run --net host --rm -it --env-file .env.$1.analyse amazon-redshift-utils analyze-vacuum
