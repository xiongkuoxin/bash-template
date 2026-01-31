#!/usr/bin/env bash

echo "🚀 Shell 开发环境检查与扩展安装"
echo "======================================"

# 0. 获取当前脚本所在目录
SCRIPT_DIR=$(dirname "$(realpath "$0")")
# 1. 从正确的路径读取扩展
CONFIG_FILE="$SCRIPT_DIR/devcontainer.json"
if [ ! -f "$CONFIG_FILE" ]; then
  echo "❌ 未找到 $CONFIG_FILE"
  exit 1
fi

echo "📄 读取配置文件: $CONFIG_FILE"

# 使用正确的 JSON 路径读取扩展
echo "🔍 提取扩展列表..."
extensions=$(jq -r '.customizations.vscode.extensions[]?' "$CONFIG_FILE" 2> /dev/null)

# 检查是否成功读取
if [ -z "$extensions" ]; then
  echo "⚠️  未能读取到扩展列表"
  echo "   配置文件结构:"
  jq '.' "$CONFIG_FILE" | head -20
  exit 1
fi

# 显示找到的扩展
echo "📦 找到的扩展:"
echo "$extensions" | sed 's/^/  • /'

# 4. 获取已安装的扩展
echo "🔍 检查已安装的扩展..."
installed_extensions=$(code --list-extensions 2> /dev/null)

# 5. 安装缺失的扩展
echo "🔄 开始安装缺失的扩展..."
echo "--------------------------------------"

installed_count=0
skipped_count=0
failed_count=0

while IFS= read -r extension; do
  # 跳过空行
  if [ -z "$extension" ]; then
    continue
  fi

  # 清理扩展名（移除可能的空格）
  extension=$(echo "$extension" | xargs)

  # 检查是否已安装
  if echo "$installed_extensions" | grep -iq "^${extension}$"; then
    echo "✅ 已安装: $extension"
    ((skipped_count++))
  else
    echo "📥 安装中: $extension"

    # 尝试安装
    if code --install-extension "$extension" --force > /dev/null 2>&1; then
      echo "   ✅ 安装成功"
      ((installed_count++))
    else
      echo "   ❌ 安装失败"
      ((failed_count++))
    fi
  fi
done <<< "$extensions"

# 6. 总结报告
echo "======================================"
echo "📊 安装总结:"
echo "  总扩展数: $(echo "$extensions" | wc -l)"
echo "  ✅ 已安装/跳过: $skipped_count"
echo "  📥 新安装: $installed_count"
echo "  ❌ 失败: $failed_count"

# 7. 最终检查
echo "🔍 最终状态检查:"
total_installed=$(code --list-extensions | wc -l)
echo "  已安装扩展总数: $total_installed"
