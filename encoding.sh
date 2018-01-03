#!/usr/bin/env bash

set -e

ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DATA_DIR="$ROOT_DIR/data"

docker build -t amazon-redshift-utils $ROOT_DIR
docker run --net host -v $DATA_DIR:/local \
    -e OUTPUT_FILE=/local/enc.$1.output.sql \
    --rm -it --env-file .env.$1.encoding \
    amazon-redshift-utils column-encoding
