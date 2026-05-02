# 基于预装了 Node.js 18.13.0 的 Debian 系统
FROM node:18.13.0

# 定义变量
ARG email="1092822098@qq.com"
LABEL maintainer=$email

# 以 root 身份安装系统依赖
USER root

# 定义环境变量
ENV AP /data/app
ENV SCPATH /etc/supervisor/conf.d

# 更新软件源并安装 supervisor
RUN sed -i 's/deb.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list && \
    apt-get -y update && \
    apt-get -y install supervisor && \
    mkdir -p /var/log/supervisor && \
    chown -R node:node /var/log/supervisor

# 拷贝 supervisord 配置文件
COPY ./supervisord/conf.d/* $SCPATH/

# 拷贝 Node.js 源码（包括 package.json 等）
COPY *.js* $AP/

# 切换工作目录
WORKDIR $AP

# 安装 npm 依赖
RUN npm install

# 切换到非 root 用户运行（必须在 CMD 之前）
USER node

# 启动 supervisor
CMD ["supervisord", "-n"]
