#! /usr/bin/env bash
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# 脚本设置（严格模式）
set -Eeuo pipefail
source "${script_dir}/../lib/bootstrap.sh"

# 当前脚本所在目录获取

function main() {
  logger "Hello, World!"
  return 0
}
# 当脚本作为主程序运行时，调用 main 函数
if [[ ${BASH_SOURCE[0]} == "${0}" ]]; then
  main
else
  # 提示用户该脚本只能作为主程序运行
  logger "Error: This script must be run as the main program."
  return 1
fi
