#!/bin/bash
# detect_interpreters.sh

echo "# 自动生成的解释器路径（供install_dependencies.sh读取）" > .env.interpreters

# 检查 python
PYTHON_BIN=""
for py in python3.10 python3 python; do
    if command -v $py >/dev/null 2>&1; then
        PYTHON_BIN=$(command -v $py)
        break
    fi
done
echo "PYTHON_BIN=$PYTHON_BIN" >> .env.interpreters
echo "PYTHON_BIN: $PYTHON_BIN"

# 检查 node
NODE_BIN=""
for node in node nodejs; do
    if command -v $node >/dev/null 2>&1; then
        NODE_BIN=$(command -v $node)
        break
    fi
done
echo "NODE_BIN=$NODE_BIN" >> .env.interpreters
echo "NODE_BIN: $NODE_BIN"
