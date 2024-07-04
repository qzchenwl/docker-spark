# Docker Spark 测试环境

[English](README.md) | 中文

🚀 一个综合的 Spark 测试环境，包含支持性的大数据工具，全部容器化以便于安装和部署！

[![GitHub stars](https://img.shields.io/github/stars/qzchenwl/docker-spark.svg)](https://github.com/qzchenwl/docker-spark/stargazers)
[![License](https://img.shields.io/badge/license-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

## 🎯 目的

本项目旨在提供一个即用型的 Spark 测试环境，使开发者能够快速搭建一个功能完备的 Spark 集群，用于测试和开发目的。

## 🌟 特性

- **以 Spark 为中心的测试环境**：非常适合测试 Spark 应用程序和查询
- **支持性大数据栈**：包含 Hadoop、Hive 等工具，模拟完整的大数据生态系统
- **便捷访问**：
  - 内置 Firefox 容器，方便在 Docker 网络内进行 Web UI 交互
  - Frp 客户端，实现从外网安全远程访问
  - 外部 Spark Thrift Server 访问：通过暴露的 Thrift server 接口，从任何地方测试 Spark SQL 查询
- **用户友好设置**：预配置组件，简单的初始化和运行脚本
- **灵活配置**：通过卷映射轻松自定义
- **可扩展性**：轻松调整服务副本以满足测试需求

## 🛠️ 组件

- Apache Spark（主要焦点）
- Hadoop
- Hive
- PostgreSQL（用于 Hive 元数据存储）
- Firefox（用于 Web UI 访问）
- Frp 客户端（用于远程访问）

## 📋 依赖

- Docker
- Docker Compose
- Bash（用于运行提供的脚本）
- sudo 权限（用于重置卷）

## 🚀 使用方法

### 初始设置

1. 克隆此仓库：
   ```
   git clone https://github.com/qzchenwl/docker-spark.git
   cd docker-spark
   ```

2. 运行初始化脚本：
   ```
   ./init.sh
   ```

### 常规使用

初始设置完成后，使用以下命令启动测试环境：

```
./run.sh
```

### 访问服务

- Spark Master：http://localhost:8080
- Spark Thrift Server：jdbc:hive2://localhost:10001（也可从外部网络访问）
- Hadoop NameNode：http://localhost:9870
- YARN Resource Manager：http://localhost:8088
- Hive Server：jdbc:hive2://localhost:10000

## 📚 文档

有关详细的配置选项、高级用法和有效 Spark 测试的技巧，请参阅我们的 [Wiki](https://github.com/qzchenwl/docker-spark/wiki)。

## 🤝 贡献

我们欢迎为改进这个 Spark 测试环境做出贡献！请查看我们的[贡献指南](CONTRIBUTING.md)了解更多详情。

## 📄 许可证

本项目采用 Apache License 2.0 许可证 - 有关详细信息，请参阅 [LICENSE](LICENSE) 文件。

## 🌟 给我们点赞！

如果您觉得这个 Spark 测试环境有用，请在 GitHub 上给我们一个星标！

[![GitHub stars](https://img.shields.io/github/stars/qzchenwl/docker-spark.svg?style=social&label=Star)](https://github.com/qzchenwl/docker-spark)

