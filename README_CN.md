## dify-sandbox-docker (英文) (中文)

本项目扩展了官方的 langgenius/dify-sandbox:0.2.11 镜像，以方便安装和管理自定义的 Python/Node.js 环境以及第三方或私有依赖。它旨在帮助您为 Dify 代码执行构建一个定制化的沙箱环境。

特性

自动检测基础镜像中所有 Python/Node.js 解释器的位置和版本

灵活地管理和扩展 Python/Node.js 环境和包

轻松添加或移除 Python 和 Node.js 依赖

支持通过 .env 文件切换 dify-sandbox 镜像版本

一键构建和启动您的自定义沙箱

包含 Dockerfile、docker-compose.yml 和 .env 的模板

## 目录结构

```
.
├── Dockerfile             # 自定义沙箱镜像
├── docker-compose.yml     # 用于本地/在线部署的 Compose 配置
├── .env                   # 环境变量（例如，沙箱版本）
├── scripts/
│   ├── detect_interpreters.sh # 检测并打印 Python/Node.js 解释器
│   └── install_dependencies.sh # 安装所需的依赖
├── requirements.txt       # Python 依赖
├── package.json           # Node.js 依赖（可选）
├── README.md
```

## 使用方法

构建您自己的 Docker 镜像

docker-compose build

然后将您的镜像推送到您的镜像仓库

将原始 dify-sandbox 镜像中的 your_registry 替换为您自己的镜像仓库地址。

像这样：

<your_registry> 替换为您自己的镜像仓库地址

sandbox:
    image: <your_registry>/dify-sandbox:0.2.12
    restart: always
    environment:
      # DifySandbox 配置
      # 请务必为您的部署更改此密钥为一个强密钥。
      # 您可以使用 `openssl rand -base64 42` 生成一个强密钥。
      API_KEY: ${SANDBOX_API_KEY:-dify-sandbox}
      GIN_MODE: ${SANDBOX_GIN_MODE:-release}
      WORKER_TIMEOUT: ${SANDBOX_WORKER_TIMEOUT:-15}
      ENABLE_NETWORK: ${SANDBOX_ENABLE_NETWORK:-true}
      HTTP_PROXY: ${SANDBOX_HTTP_PROXY:-http://ssrf_proxy:3128}
      HTTPS_PROXY: ${SANDBOX_HTTPS_PROXY:-http://ssrf_proxy:3128}
      SANDBOX_PORT: ${SANDBOX_PORT:-8194}
      PIP_MIRROR_URL: ${PIP_MIRROR_URL:-}
    volumes:
      - ./volumes/sandbox/dependencies:/dependencies
      - ./volumes/sandbox/conf:/conf
    healthcheck:
      test: [ 'CMD', 'curl', '-f', 'http://localhost:8194/health' ]
    networks:
      - ssrf_proxy_network

贡献
欢迎提交 Issue、PR 和建议，以帮助改进这个通用的 dify-sandbox 镜像项目！

许可证
MIT