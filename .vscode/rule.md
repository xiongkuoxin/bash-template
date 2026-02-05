# rule

1. 变量定义
   - 只读变量：使用 `declare -rx` 定义，只能读取不能修改。
   - 普通变量：使用 `declare -x` 定义，可读可写。
   - 禁止使用 `readonly`,`local` 定义变量，只能使用 `declare` 定义,方便CI等环境中check变量是否定义。

