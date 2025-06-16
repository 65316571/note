# 认识docker？了解docker是什么？有什么用？

### 介绍docker？

Docker是一种开源的容器化平台，使开发人员能够自动化应用程序的部署、管理、扩展和运行。通过使用容器技术，Docker将应用程序及其依赖环境打包到一个标准化的单元中，这样无论在任何平台或环境下都能保证应用程序的运行一致性。Docker基于Linux内核的cgroups和命名空间（namespaces）技术，并利用了UnionFS等文件系统来提供独立的文件系统层。容器相较于传统的虚拟机更轻量级，占用资源更少，启动速度更快，适合微服务架构和持续集成/持续部署（CI/CD）等现代软件开发模式。

### docker是什么？

虚拟化容器引擎技术（maven）
Docker是基于Go语言实现的云开源项目。
一个开源的应用容器引擎，让开发者可以打包他们的应用以及依赖包到
一个可抑制的容器中，然后发布到任何流行的Linux机器上，也可以实现虚拟化。
容器完全使用沙盒机制，相互之间不会存在任何接口。
总之，一句话，docker解决了项目的运行环境和配置问题的软件容器，
方便做持续集成并有助于整体发布的容器虚拟化技术。

### docker有什么用？

1、解决运行环境不一致所导致的问题；(开发环境  测试环境  运行环境)
2、一次构建、随处运行
3、更快速的应用交付和部署
4、更便捷的升级和扩缩容
5、更简单的系统运维

### 2、docker三要素：

- 容器（Container）

容器是Docker的运行时实例，它包含了应用程序及其所有依赖项，在隔离的环境中运行。每个容器都是一个轻量级、独立的单元，可以被迅速创建、启动、停止和销毁。容器提供了与宿主系统隔离的环境，但与虚拟机不同，容器共享宿主机的操作系统内核，因而更加高效。

- 镜像（Image）

镜像是Docker容器的只读模板，它包含了运行应用程序所需的一切内容（如代码、运行时、库和配置文件）。镜像通过层（layer）的方式构建，允许共享和重用公共的层，提高了构建和分发的效率。镜像是容器的源头，一个镜像可以生成多个容器。镜像的创建通常是通过Dockerfile来定义，其中包括一系列指令来逐步构建镜像。

- 仓库（Repository）

仓库是存储和分发Docker镜像的地方，可以视为一个镜像的集合。Docker仓库分为公共仓库和私有仓库。Docker Hub是最常用的公共仓库，开发者可以在上面发布和获取镜像。私有仓库则用于存储公司内部的镜像，保证了代码和数据的安全性。仓库中的镜像通过标签（tag）进行版本管理，方便用户获取特定版本的镜像。



### 3、docker的核心组件：

Docker是一种容器化平台，主要用于创建、分发和运行容器。其核心组件包括：

- **Docker Engine**：用于构建和运行容器的核心引擎。
- **Docker镜像**：容器的只读模板，包含了应用程序及其运行所需的所有内容。
- **Docker容器**：镜像的运行时实例，独立运行的单元。
- **Docker Hub**：一个公共的镜像仓库，用户可以在上面发布和获取镜像。



### 4、其他概念：

Volume（数据容器卷）

​		卷是Docker用于持久化数据的机制，可以在容器之间共享数据。卷存储在宿主机的文件系统中，独立于容器的生命周期，这意味着即使容器被删除，数据仍然存在。卷可以提高数据的安全性和持久性，尤其在状态数据管理中非常重要。

Networking（网络）

​		Docker提供了多种网络模式来连接容器和宿主机网络，包括Bridge、Host、Overlay等模式。每种模式都有其特定的使用场景和优势，Docker网络功能使得跨主机的容器通信和服务发现变得更加简单。



### 5、安装docker步骤：

```
docker安装:
yum -y install gcc
yum -y install gcc-c++  安装c++语言的运行环境
yum install -y yum-utils  安装相关的根据包
yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo   设置阿里云镜像仓库
yum makecache fast       更新yum软件包索引
yum -y install docker-ce docker-ce-cli containerd.io  安装docker

启动docker:
  systemctl start docker
docker version 查看安装的docker版本

docker的配置和应用:
进入  cd /etc/docker目录
配置阿里云的镜像加速服务器
vi  /etc/docker/daemon.json

{
  "registry-mirrors": ["https://[自己的阿里云加速地址].mirror.aliyuncs.com"]
}


例子：
{
  "registry-mirrors": ["https://pfr9o6cv.mirror.aliyuncs.com"]
}

保存退出并将配置信息重新加载到系统环境中
systemctl daemon-reload
重新启动docker
systemctl restart docker
```

### 6、常用的docker操作：

```
启动docker： systemctl start docker
停止docker： systemctl stop docker
重启docker： systemctl restart docker
查看docker状态： systemctl status docker

docker images   列出本地Docker主机上已有的 Docker 镜像
docker run -it 镜像ID /bin/bash	启动基于这个镜像的容器，并进入其 Bash Shell

exit	 退出容器
Ctrl+q+p 返回Linux（不会关闭容器）

docker ps		 列出当前运行中的容器
docker exec -it  容器ID bin/bash	进入容器ID的 Bash Shell
```

### 7、其他命令：

```
安装运行redis：
	docker pull redis 	下载最新版redis
	docker run --restart=always --log-opt max-size=100m --log-opt max-file=2 -p 6379:6379 --name myredis -v /usr/local/redis/redis.conf:/etc/redis/redis.conf -v /usr/local/redis/data:/data -d redis redis-server /etc/redis/redis.conf  --appendonly yes  --requirepass 123456	 启动redis容器
	docker exec -it 42da814eb365 /bin/bash	运行docker容器
	docker logs --since 30m myredis		日志输出 期限为30分钟
	auth 123456		输入权限密码
	
	
安装运行mysql：
	docker pull mysql:5.7	下载对应版本的mysql
	docker run -p 3307:3307 --name mysql5.7 -v /usr/local/docker/mysql/conf:/etc/mysql -v /usr/local/docker/mysql/logs:/var/log/mysql -v /usr/local/docker/mysql/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 -d mysql:5.7	 启动mysql容器
	docker exec  -it  mysql5.7 bin/bash	   运行docker容器
	mysql -uroot -p123456				   启动mysql
```


