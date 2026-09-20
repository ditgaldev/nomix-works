# Docker Build & Up

目标: 快速部署体验系统，帮助了解系统之间的依赖关系。
依赖：docker compose v2，删除`name: nomix-system`，降低`version`版本为`3.3`以下，支持`docker-compose`。

## 功能文件列表

```text
.
├── Docker-HOWTO.md                 
├── docker-compose.yml              
└── docker.env                      <-- Docker Compose 环境变量示例

../../nomix-server/Dockerfile
../../nomix-ui/nomix-ui-admin-vue3/Dockerfile
../../nomix-ui/nomix-ui-admin-vue3/nginx.conf
```

## 构建 jar 包

```shell
# 创建maven缓存volume
docker volume create --name nomix-maven-repo

docker run -it --rm --name nomix-maven \
    -v nomix-maven-repo:/root/.m2 \
    -v $PWD:/usr/src/mymaven \
    -w /usr/src/mymaven \
    maven:3.9-eclipse-temurin-17 mvn clean package -DskipTests
```

## 构建启动服务

```shell
docker compose --env-file docker.env up -d
```

首次运行会自动构建容器。可以通过`docker compose build [service]`来手动构建所有或某个docker镜像

`docker.env` 中的账号和密码仅用于本地体验。部署到外部环境前，应替换为对应环境的配置。

## 服务器的宿主机端口映射

- admin ui: http://localhost:8080
- api server: http://localhost:48080
- mysql: port 3306，账号密码取自 `docker.env`
- redis: port: 6379
