# Docker快速入土

本页最后更新时间：2022年7月21日

## 摘录整合以下教程

[Docker 10分钟快速入门_哔哩哔哩_bilibili](https://www.bilibili.com/video/BV1s54y1n7Ev)

[前言 - Docker — 从入门到实践 (gitbook.io)](https://yeasy.gitbook.io/docker_practice/)

[Docker Documentation | Docker Documentation](https://docs.docker.com/)

---

### 第一部分：安装docker

#### Linux（Ubuntu）

[在 Ubuntu |上安装 Docker 引擎Docker 文档](https://docs.docker.com/engine/install/ubuntu/)

##### 卸载旧版本Docker

```bash
sudo apt-get remove docker docker-engine docker.io containerd runc
```

##### 安装稳定版Docker

```bash
 curl -fsSL https://get.docker.com -o get-docker.sh
 sudo sh get-docker.sh --mirror Aliyun
```

##### 安装预发行版Docker

```bash
curl -fsSL https://test.docker.com -o test-docker.sh
sudo sh test-docker.sh --mirror Aliyun
```

##### 使用脚本安装后升级Docker

如果您使用脚本安装了 Docker，则应直接使用包管理器升级 Docker。重新运行脚本没有任何好处，如果它尝试重新添加已添加到主机的存储库，则可能会导致问题。

##### 卸载Docker Engine

卸载 Docker 引擎、CLI、Containerd 和 Docker Compose 包：

```bash
sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

主机上的映像、容器、卷或自定义配置文件不会自动删除。删除所有映像、容器和卷：

```bash
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd
```

您必须手动删除任何已编辑的配置文件。

#### Windows

[在 Windows | 上安装 Docker DesktopDocker 文档](https://docs.docker.com/desktop/install/windows-install/)

##### WSL 2 后端

- Windows 11 64 位：家庭版或专业版 21H2 或更高版本，或企业版或教育版 21H2 或更高版本。

- Windows 10 64 位：家庭版或专业版 21H1（内部版本 19043）或更高版本，或企业版或教育版 20H2（内部版本 19042）或更高版本。

- 在 Windows 上启用 WSL 2 功能。有关详细说明，请参阅[微软文档](https://docs.microsoft.com/en-us/windows/wsl/install-win10)。

- 要在 Windows 10 或 Windows 11 上成功运行 WSL 2，需要满足以下硬件先决条件：

  - 具有[二级地址转换 （SLAT） 功能](https://en.wikipedia.org/wiki/Second_Level_Address_Translation)的 64 位处理器
  - 4GB 系统内存
  - 必须在 BIOS 设置中启用 BIOS 级别的硬件虚拟化支持。有关详细信息，请参阅[虚拟化](https://docs.docker.com/desktop/windows/troubleshoot/#virtualization-must-be-enabled)。

- 下载并安装 [Linux 内核更新程序包](https://docs.microsoft.com/windows/wsl/wsl2-kernel)。

  启动docker desktop

  ![docker desktop](assets/62d0fee747bbe.png)

  未完待续...
