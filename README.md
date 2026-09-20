# Nomix

Nomix 是一个前后端分离的企业管理系统，包含 Java 后端、PC 管理端、移动管理端和商城端。

项目仓库：https://github.com/ditgaldev/nomix-works

## 项目结构

### 后端模块

| 目录 | 功能 | 默认构建 |
| --- | --- | --- |
| `nomix-dependencies` | Maven 依赖版本统一管理 | 是 |
| `nomix-framework` | 公共框架与 Spring Boot Starter | 是 |
| `nomix-server` | 后端应用启动与模块装配 | 是 |
| `nomix-module-system` | 用户、部门、权限、租户、数据字典等系统功能 | 是 |
| `nomix-module-infra` | 文件、任务、日志、代码生成、接口文档等基础设施 | 是 |
| `nomix-module-member` | 会员、会员等级、积分与用户中心 | 否 |
| `nomix-module-pay` | 商户、支付、退款与支付通知 | 否 |
| `nomix-module-mall` | 商品、营销、交易与商城统计 | 否 |
| `nomix-module-ai` | 大模型聊天、绘图、音乐、写作和知识库 | 否 |
| `nomix-module-bpm` | Flowable 工作流、流程表单、审批和任务中心 | 否 |
| `nomix-module-report` | 报表、打印、图形和数据大屏 | 否 |
| `nomix-module-mp` | 微信公众号账号、菜单、粉丝、消息和素材 | 否 |
| `nomix-module-crm` | 客户、联系人、商机、合同与回款 | 否 |
| `nomix-module-erp` | 采购、销售、库存、财务与产品管理 | 否 |
| `nomix-module-iot` | IoT 设备接入、核心能力、业务管理与网关 | 否 |
| `nomix-module-mes` | 生产、设备、质量、排班与制造执行管理 | 否 |
| `nomix-module-wms` | 仓库、物料、库存、入库、出库和盘库 | 否 |
| `nomix-module-hrm` | 员工、招聘、考勤、薪资、社保与绩效 | 否 |
| `nomix-module-fms` | 凭证、账簿、报表与财务结账 | 否 |
| `nomix-module-pms` | 项目、事项、迭代、看板、工时和知识库 | 否 |
| `nomix-module-im` | 单聊、群聊、消息收发、撤回和已读状态 | 否 |

“默认构建”为“是”的模块已在根目录 `pom.xml` 的 `<modules>` 中启用。“否”的模块源码仍完整保留，只是默认没有加入 Maven Reactor；需要使用时，在根目录 `pom.xml` 中启用对应 `<module>`，并准备该模块需要的配置和数据库表。

`nomix-framework` 内含公共基础包以及 MyBatis、Redis、Web、安全、WebSocket、监控、任务、消息队列、Excel、租户和数据权限等 Starter。`nomix-module-mall` 内含商品、营销、交易、统计等子模块，`nomix-module-iot` 内含业务、核心和网关子模块。

### 前端应用

| 目录 | 功能 |
| --- | --- |
| `nomix-ui/nomix-ui-admin-vue3` | PC 管理端 |
| `nomix-ui/nomix-ui-admin-uniapp` | 移动管理端 |
| `nomix-ui/nomix-ui-mall-uniapp` | 商城端 |

### 基础目录

| 目录 | 内容 |
| --- | --- |
| `sql` | MySQL、PostgreSQL、Oracle、SQL Server、达梦、人大金仓、OpenGauss 等数据库脚本 |
| `script/local` | 当前工作站的一键启动与停止脚本 |
| `script/docker` | Docker 运行配置 |
| `script/shell` | Linux 部署与运维脚本 |
| `script/idea` | IDEA 辅助配置 |
| `script/jenkins` | Jenkins 构建脚本 |

## 环境

- JDK 17
- Spring Boot 3.5.15
- Maven 3.6+
- MySQL 8
- Redis 6+
- Node.js 20.19+
- pnpm 8+
- HBuilderX

## 数据库

创建数据库 `nomix-vue-pro`，然后依次导入：

```text
sql/mysql/nomix-vue-pro.sql
sql/mysql/quartz.sql
```

数据库和 Redis 连接配置位于：

```text
nomix-server/src/main/resources/application-local.yaml
```

## 一键启动

当前工作站可直接运行：

```powershell
powershell -ExecutionPolicy Bypass -File script\local\start.ps1
```

脚本会启动 MySQL、Redis、后端、PC 管理端和商城端，日志保存在 `outputs/startup/`。

## 分别启动

后端：

```powershell
$env:JAVA_HOME = 'D:\application\jdk\17\jdk'
mvn -DskipTests clean package
java -jar nomix-server\target\nomix-server.jar
```

PC 管理端：

```powershell
cd nomix-ui\nomix-ui-admin-vue3
pnpm install
pnpm dev
```

移动管理端：

```powershell
cd nomix-ui\nomix-ui-admin-uniapp
pnpm install
pnpm dev:h5
```

商城端通过 HBuilderX 运行 `nomix-ui/nomix-ui-mall-uniapp`，也可以使用一键启动脚本。

## 本地地址

| 服务 | 地址 |
| --- | --- |
| 后端 | `http://127.0.0.1:48080` |
| PC 管理端 | `http://127.0.0.1:5173` |
| 商城端 | `http://127.0.0.1:3000` |
| 移动管理端 | `http://127.0.0.1:9000` |

## 默认登录

```text
租户：Nomix
账号：admin
密码：admin123
```

实际登录信息以当前数据库为准。
