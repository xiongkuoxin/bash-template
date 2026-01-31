#!/bin/bash

# 一、变量和字符传操作
# 1. 用户信息输出
# 编写脚本，输出当前用户信息：
# 用户名
# 用户ID
# 主目录
# 登录shell

# printf "当前用户信息：\n"
# printf "用户名: %s\n" "$USER"
# printf "用户ID: %s\n" "$UID"
# printf "主目录: %s\n" "$HOME"
# printf "登录shell: %s\n" "$SHELL"

# 2. 日期格式化
# 输出当前日期，格式为：
# 今天是：2024年10月1日 星期二
# 当前时间：14:30:45

# week_num=$(date +'%u')
# chinese_days=(一 二 三 四 五 六 日)
# week_day=${chinese_days[week_num - 1]}
# printf "今天是：%s\n" "$(date +'%Y年%m月%d日') 星期${week_day}"
# printf "当前时间：%s\n" "$(date +'%H:%M:%S')"

# 3.字符串长度
# 读取用户输入的字符串，输出该字符串的长度

# printf "请输入一个字符串："
# read -r input_str
# printf "该字符串的长度为：%d\n" "${#input_str}"

# 4.字符串反转
# 读取用户输入的字符串，输出该字符串的反转结果

# printf "请输入一个字符串："
# read -r input_str
# # reversed_str=$(echo "$input_str" | rev)
# # 考虑rev命令不存在的情况，选择awk函数
# reversed_str=$(echo "$input_str" | awk '{for(i=length;i!=0;i--)x=x substr($0,i,1);print x; x=""}')
# printf "该字符串的反转结果为：%s\n" "$reversed_str"

# 5.字符串拼接
# 读取姓和名，输出完整的姓名。

# printf "请输入你的姓："
# read -r last_name
# printf "请输入你的名："
# read -r first_name
# full_name="${last_name}${first_name}"
# printf "你的完整姓名是：%s\n" "$full_name"

# 6.大小写转换
# 读取用户输入的字符串，输出该字符串的大写和小写形式

# printf "请输入一个字符串："
# read -r input_str
# printf "该字符串的原始形式为：%s\n" "$input_str"
# printf "该字符串的大写形式为：%s\n" "$(echo "$input_str" | tr '[:lower:]' '[:upper:]')"
# printf "该字符串的小写形式为：%s\n" "$(echo "$input_str" | tr '[:upper:]' '[:lower:]')"

# 7. 字符串切片
# 读取一个字符串和起始位置、长度，输出子串。

# printf "请输入一个字符串："
# read -r input_str
# printf "请输入子串的起始位置："
# read -r start_pos
# printf "请输入子串的长度："
# read -r sub_len
# sub_str=${input_str:start_pos:sub_len}
# printf "从位置 %d 开始，长度为 %d 的子串为：%s\n" "$start_pos" "$sub_len" "$sub_str"

# 8. 变量默认值
# 如果变量未定义，使用默认值"guest"。

# read -p "请输入你的姓名：" -r name
# read -p "请输入你的密码：" -rs pass
# printf '\n'
# name=${name:-"guest"}
# printf "你好，%s！\n" "$name"
# printf "你的密码为%s,请不要遗忘\n" ${pass}

# 9. 环境变量列表
# 输出所有环境变量及其值。

# printf "所有环境变量及其值如下：\n"
# env | sort | awk -F= '{printf "%-30s %s\n", $1, $2}'

# 10. 参数个数判断
# 检查脚本参数个数，小于3则提示用户用法。

# if [ "$#" -lt 3 ]; then
#   printf "用法：%s <参数1> <参数2> <参数3>\n" "$0"
#   exit 1
# fi

# if (("$#" < 3)); then
#   printf "用法：%s <参数1> <参数2> <参数3>\n" "$0"
#   exit 1
# fi

# 二、输入输出

# 11. 简单计算器
# 编写一个简单的计算器，读取用户输入的两个数字和运算符（+、-、*、/），输出计算结果。

# read -rp "请输入第一个数字：" num1
# read -rp "请输入运算符（+、-、*、/）：" operator
# read -rp "请输入第二个数字：" num2
# # printf "计算结果为：%s\n" "$(python3 -c "print($num1 $operator $num2)")"
# result=$(awk -v a="${num1}" -v op="${operator}" -v b="${num2}" 'BEGIN{
#   if (op == "+"){
#     print a+b;
#   } else if (op == "-"){
#     print a-b;
#   } else if (op == "*"){
#     print a*b;
#   } else if (op == "/"){
#     if (b == 0){
#       print "除数不能为0";
#     } else {
#       print a/b;
#     }
#   } else {
#     print "无效的运算符";
#   }
# }')
# printf "计算结果为：%s\n" "$result"

# 12. 文件行计数器
# 输入文件名，输出文件行数。
# read -erp "请输入文件名：" filename
# line_count=$(wc -l <"$filename")
# printf "文件 %s 有 %d 行\n" "$filename" "$line_count"

# 13. 交互式菜单
# 显示菜单：
# ```
# 1. 显示时间
# 2. 显示日历
# 3. 显示当前目录
# 4. 退出
# ```

printf "1. 显示时间\n"
printf "2. 显示日历\n"
printf "3. 显示当前目录\n"
printf "4. 退出\n"
read -rp "请输入你的选择：" choice
case $choice in
1)
  printf "当前时间：%s\n" "$(date +'%H:%M:%S')"
  ;;
2)
  printf "当前日历：\n"
  cal
  ;;
3)
  printf "当前目录：%s\n" "$(pwd)"
  ;;
4)
  printf "退出程序\n"
  exit 0
  ;;
*)
  printf "无效的选择，请输入1-4之间的数字\n"
  ;;
esac

# 14. 密码隐藏输入
# 输入密码时不显示字符。

# 15. 颜色输出
# 用不同颜色输出"错误"、"警告"、"成功"信息。

# 16. 进度条模拟
# 显示一个从0%到100%的简单进度条。

# 17. 倒计时
# 输入秒数，进行倒计时显示。

# 18. 多选输入
# 让用户从多个选项中选择（可多选）。

# 19. 文件选择器
# 列出当前目录文件，让用户选择。

# 20. 确认提示
# 执行操作前要求用户确认（Y/N）。

# 三、条件判断

# 21. 数字比较
# 输入两个数字，比较大小。

# 22. 成绩判断
# 输入分数（0-100），输出等级：
# - 90-100: A
# - 80-89: B
# - 70-79: C
# - 60-69: D
# - <60: F

# 23. 闰年判断
# 输入年份，判断是否为闰年。

# 24. 文件类型判断
# 输入文件名，判断是文件、目录还是其他。

# 25. 文件权限检查
# 检查文件是否有读、写、执行权限。

# 26. 数字范围判断
# 输入数字，判断是否在1-100之间。

# 27. 字符串相等判断
# 输入两个字符串，判断是否相等。

# 28. 空字符串检查
# 检查输入的字符串是否为空。

# 29. 奇偶判断
# 输入数字，判断是奇数还是偶数。

# 30. 三位数判断
# 输入数字，判断是否为三位数。

# 四、循环结构

# 31. 乘法表
# 输出9x9乘法表。

# 32. 数字求和
# 输入n，计算1+2+3+...+n的和。

# 33. 偶数求和
# 计算1-100所有偶数的和。

# 34. 质数判断
# 输入数字，判断是否为质数。

# 35. 打印菱形
# 输入高度，打印菱形图案。

# 36. 斐波那契数列
# 输出前n个斐波那契数。

# 37. 阶乘计算
# 计算n的阶乘。

# 38. 水仙花数
# 打印所有三位数的水仙花数。
