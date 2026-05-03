# Docker Node.js Hello World

基于 Node.js 18.13.0 的 Web 应用示例，集成 Supervisor 进程管理，以非 root 用户运行，监听 8080 端口，支持 WHO/PORT 环境变量动态配置。

## 技术栈
- Node.js 18.13.0 (Express)
- Docker 多阶段构建
- Supervisor 进程管理
- 非 root 用户安全实践

## 快速启动
```bash
docker pull swr.cn-east-5.myhuaweicloud.com/oreo-calar/docker-node-hello:latest
docker run -d -p 8080:8080 swr.cn-east-5.myhuaweicloud.com/oreo-calar/docker-node-hello:latest
curl http://localhost:8080
