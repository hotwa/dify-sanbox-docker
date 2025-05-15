ARG DIFY_SANDBOX_VERSION
FROM langgenius/dify-sandbox:${DIFY_SANDBOX_VERSION}

# 复制依赖文件和脚本（如有需要）
COPY requirements.txt /requirements.txt
COPY package.json /package.json
COPY scripts/ /scripts/

# 检查并安装依赖（可以构建时安装，也可运行后再装）
RUN bash /scripts/detect_interpreters.sh && \
    bash /scripts/install_dependencies.sh


