# shell-template

这是一个 shell 脚本模板，用于快速创建新的 shell 脚本。

## 目录结构

```text
/workspace/
├── bin/                    # 可执行脚本（主要入口点）
│   ├── main.sh            # 主程序入口
│   └── cli.sh             # 命令行接口
├── lib/                   # 库函数和模块
│   ├── utils.sh           # 通用工具函数
│   ├── logging.sh         # 日志功能
│   ├── config.sh          # 配置管理
│   └── validation.sh      # 输入验证
├── src/                   # 核心业务逻辑
│   ├── core/
│   │   ├── processor.sh   # 数据处理
│   │   └── analyzer.sh    # 数据分析
│   └── api/
│       ├── http.sh        # HTTP请求处理
│       └── database.sh    # 数据库操作
├── config/                # 配置文件
│   ├── default.conf       # 默认配置
│   ├── development.conf   # 开发环境配置
│   └── production.conf    # 生产环境配置
├── tests/                 # 测试文件
│   ├── unit/              # 单元测试
│   ├── integration/       # 集成测试
│   └── fixtures/          # 测试数据
├── docs/                  # 文档
│   ├── README.md          # 项目说明
│   ├── INSTALL.md         # 安装指南
│   └── API.md             # API文档
├── scripts/               # 构建和部署脚本
│   ├── build.sh           # 构建脚本
│   ├── deploy.sh          # 部署脚本
│   └── setup.sh           # 环境设置脚本
├── logs/                  # 日志文件（git忽略）
├── tmp/                   # 临时文件（git忽略）
├── .shellcheckrc          # shellcheck配置
├── Makefile               # 构建管理
└── .gitignore             # Git忽略文件
```

## 各目录说明

### 1. **bin/** - 可执行脚本

- 存放可以直接运行的脚本
- 文件应具有可执行权限 (`chmod +x`)
- 作为项目的入口点

### 2. **lib/** - 库函数

- 可重用的函数和模块
- 使用 `source` 命令引入到主脚本中
- 按功能分类组织

### 3. **src/** - 核心业务逻辑

- 主要的业务处理代码
- 按模块或功能划分目录
- 避免在bin目录中放置复杂逻辑

### 4. **config/** - 配置文件

- 环境相关的配置
- 支持不同环境的配置
- 敏感信息应使用环境变量

### 5. **tests/** - 测试

- 使用shell测试框架（如bats）
- 单元测试和集成测试分离
- 测试数据单独存放

### 6. **docs/** - 文档

- 项目说明和使用指南
- API文档和开发文档

## 最佳实践建议

1. **权限管理**：确保bin目录下的脚本有执行权限
2. **模块化**：将功能拆分为小函数，便于测试和维护
3. **错误处理**：每个脚本都应包含适当的错误处理
4. **日志记录**：统一的日志格式和级别
5. **配置管理**：支持环境变量和配置文件

## 示例使用方式

```bash
# 运行主程序
./bin/main.sh

# 引入库函数
source lib/utils.sh
source lib/logging.sh

# 运行测试
./tests/unit/test_utils.sh
```

这个目录结构能够很好地支持shell项目的开发、测试和部署，同时保持了代码的可维护性和可扩展性。你可以根据项目规模适当调整这个结构。
