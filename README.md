# Docker Spark Testing Environment

English | [中文](README_zh.md)

🚀 A comprehensive Spark testing environment with supporting Big Data tools, all containerized for easy setup and deployment!

[![GitHub stars](https://img.shields.io/github/stars/qzchenwl/docker-spark.svg)](https://github.com/qzchenwl/docker-spark/stargazers)
[![License](https://img.shields.io/badge/license-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

## 🎯 Purpose

This project aims to provide a ready-to-use Spark testing environment, allowing developers to quickly set up a full-featured Spark cluster for testing and development purposes.

## 🌟 Features

- **Spark-Centric Testing Environment**: Ideal for testing Spark applications and queries
- **Supporting Big Data Stack**: Includes Hadoop, Hive, and other tools to simulate a complete big data ecosystem
- **Easy Access**:
  - Built-in Firefox container for seamless web UI interactions within the Docker network
  - Frp client for secure remote access from outside your local network
  - External Spark Thrift Server Access: Test Spark SQL queries from anywhere using the exposed Thrift server interface
- **User-Friendly Setup**: Pre-configured components with simple initialization and run scripts
- **Flexible Configuration**: Easy customization through volume mapping
- **Scalability**: Easily adjust service replicas to match your testing needs

## 🛠️ Components

- Apache Spark (primary focus)
- Hadoop
- Hive
- PostgreSQL (for Hive metastore)
- Firefox (for web UI access services in container network)
- Frp client (for remote access)

## 📋 Dependencies

- Docker
- Docker Compose
- Bash (for running the provided scripts)
- sudo privileges (for resetting volumes)

## 🚀 Usage

### Initial Setup

1. Clone this repository:
   ```
   git clone https://github.com/qzchenwl/docker-spark.git
   cd docker-spark
   ```

2. Run the initialization script:
   ```
   ./init.sh
   ```

### Regular Usage

After the initial setup, start the testing environment with:

```
./run.sh
```

### Accessing Services

| Service | Local URL | Container URL | Public URL |
| ------- | --------- | ------------- | ---------- |
| Spark Master | http://localhost:8080 | http://spark-master:8080 | - |
| Spark Thrift Server | jdbc:hive2://localhost:10001 | jdbc:hive2://spark-thriftserver:10000 | jdbc:hive2://frp-fly.top:19943 (Edit confg/frp/frpc.ini to provide your own) |
| Hadoop NameNode | http://localhost:9870 | http://hadoop-namenode:9870 | - |
| YARN Resource Manager | http://localhost:8088 | http://hadoop-resourcemanager:8088 | - |
| Hive Server | jdbc:hive2://localhost:10000 | jdbc:hive2://hive-server:10000 | - |
| Firefox | http://localhost:5800 | - | - |

## 📚 Documentation

For detailed configuration options, advanced usage, and tips for effective Spark testing, please refer to our [Wiki](https://github.com/qzchenwl/docker-spark/wiki).

## 🤝 Contributing

We welcome contributions to improve this Spark testing environment! Please see our [Contributing Guidelines](CONTRIBUTING.md) for more details.

## 📄 License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

## 🌟 Star Us!

If you find this Spark testing environment useful, please give us a star on GitHub!

[![GitHub stars](https://img.shields.io/github/stars/qzchenwl/docker-spark.svg?style=social&label=Star)](https://github.com/qzchenwl/docker-spark)

