#!/bin/bash
# install_dependencies.sh

# 导入解释器路径
if [ -f .env.interpreters ]; then
    set -a
    source .env.interpreters
    set +a
else
    echo ".env.interpreters 文件不存在，请先运行 detect_interpreters.sh"
    exit 1
fi

# 使用指定的解释器安装 Python 包
if [ -n "$PYTHON_BIN" ] && [ -f requirements.txt ]; then
    echo "使用 $PYTHON_BIN -m pip 安装 Python 包..."
    $PYTHON_BIN -m pip install --upgrade pip
    $PYTHON_BIN -m pip install -r requirements.txt
else
    echo "没有检测到 Python 解释器或 requirements.txt"
fi

# 使用指定的解释器安装 Node.js 包
if [ -n "$NODE_BIN" ] && [ -f package.json ]; then
    if command -v npm >/dev/null 2>&1; then
        echo "使用 $NODE_BIN 和 npm 安装 Node.js 包..."
        npm install
    else
        echo "未找到 npm，无法安装 Node.js 包"
    fi
else
    echo "没有检测到 Node.js 解释器或 package.json"
fi
