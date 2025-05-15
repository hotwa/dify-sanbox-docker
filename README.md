# dify-sandbox-docker (English) ([Chinese](./README_zh.md))

This project extends the official [langgenius/dify-sandbox:0.2.11](https://hub.docker.com/r/langgenius/dify-sandbox) image to allow easy installation and management of custom Python/Node.js environments and third-party or private dependencies. It is designed to help you build a customized sandbox environment for Dify code execution.

## Features

* Automatically detects the location and version of all Python/Node.js interpreters in the base image
* Flexible management and extension of Python/Node.js environments and packages
* Easily add or remove Python and Node.js dependencies
* Supports switching dify-sandbox image version via `.env` file
* One-command build and launch of your custom sandbox
* Includes templates for Dockerfile, docker-compose.yml, and .env

## Directory Structure

```
.
├── Dockerfile               # Custom sandbox image
├── docker-compose.yml       # Compose config for local/online deployment
├── .env                     # Environment variables (e.g., sandbox version)
├── scripts/
│   ├── detect_interpreters.sh  # Detect and print Python/Node.js interpreters
│   └── install_dependencies.sh # Install required dependencies
├── requirements.txt         # Python dependencies
├── package.json             # Node.js dependencies (optional)
├── README.md
```

## Usage

build your own docker images

```bash 
docker-compose build
```

then push your images to your registry

replace `your_registry` with your own registry  in orign difiy-sandbox image

like this:

<your_registry> replace with your own registry

```yaml
sandbox:
    image: <your_registry>/dify-sandbox:0.2.12
    restart: always
    environment:
      # The DifySandbox configurations
      # Make sure you are changing this key for your deployment with a strong key.
      # You can generate a strong key using `openssl rand -base64 42`.
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
```

---

## Contributing

Issues, PRs, and suggestions are welcome to help improve this generic dify-sandbox image project!

---

## License

MIT