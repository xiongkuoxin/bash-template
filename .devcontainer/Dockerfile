FROM xiongkuoxin/debian-bookworm-dev:1.0.0

# ========== 安装 Shell 开发工具 ==========
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    shellcheck \
    make \
    shfmt \
    && \
    # 清理缓存
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# ========== 配置开发环境 ==========
USER ${USER}
WORKDIR ${WORKSPACE}

# 配置 bash 环境
RUN echo 'export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\\$ "' >> ~/.bashrc && \
    echo 'alias ll="ls -la"' >> ~/.bashrc && \
    echo 'alias la="ls -A"' >> ~/.bashrc && \
    echo 'alias l="ls -CF"' >> ~/.bashrc && \
    echo 'alias ..="cd .."' >> ~/.bashrc && \
    echo 'alias ...="cd ../.."' >> ~/.bashrc && \
    echo 'alias grep="grep --color=auto"' >> ~/.bashrc && \
    echo 'alias fgrep="fgrep --color=auto"' >> ~/.bashrc && \
    echo 'alias egrep="egrep --color=auto"' >> ~/.bashrc && \
    echo 'export EDITOR=vim' >> ~/.bashrc

# 创建常用目录
RUN mkdir -p ~/.local/bin && \
    mkdir -p ~/.config/shell

# ========== 验证安装 ==========
RUN echo "=== 开发环境验证 ===" && \
    echo "1. 系统信息:" && \
    lsb_release -a 2>/dev/null | grep "Description" && \
    echo "" && \
    echo "2. 已安装工具:" && \
    echo "  - Bash: $(bash --version | head -1)" && \
    echo "  - ShellCheck: $(shellcheck --version | head -1)" && \
    echo "  - shfmt: $(shfmt --version)" && \
    echo "  - Git: $(git --version)" && \
    echo "" && \
    echo "3. 用户信息:" && \
    echo "  - 用户: $(whoami)" && \
    echo "  - UID: $(id -u)" && \
    echo "  - 工作目录: $(pwd)"

# ========== 健康检查 ==========
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD bash -c "command -v bash && command -v shellcheck && command -v shfmt" || exit 1

# ========== 默认命令 ==========
CMD ["sleep", "infinity"]
