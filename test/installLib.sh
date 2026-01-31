#!/usr/bin/env bash

# test目录结构
: <<EOF
src/
    project.sh
    ...
test/
  bats/               <- submodule
  test_helper/
      bats-support/   <- submodule
      bats-assert/    <- submodule
  test.bats
  ...
EOF
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd "$script_dir/.."

# 创建父级目录
mkdir -p test/bats
mkdir -p test/test_helper/
mkdir -p test/test_helper/

is_git_repo=$(git rev-parse --is-inside-work-tree 2>/dev/null || echo "false")
if [ "$is_git_repo" = "true" ]; then
  git submodule add https://github.com/bats-core/bats-core.git test/bats
  git submodule add https://github.com/bats-core/bats-support.git test/test_helper/bats-support
  git submodule add https://github.com/bats-core/bats-assert.git test/test_helper/bats-assert
else
  git clone https://github.com/bats-core/bats-core.git test/bats
  git clone https://github.com/bats-core/bats-support.git test/test_helper/bats-support
  git clone https://github.com/bats-core/bats-assert.git test/test_helper/bats-assert
fi
