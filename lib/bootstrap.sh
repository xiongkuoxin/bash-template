#!/usr/bin/env bash

bootstrap_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# 引入logger库
# shellcheck source=./logger.sh
source "${bootstrap_dir}/logger.sh"
