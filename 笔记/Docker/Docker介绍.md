容器化时代来了
虚拟化技术已经走过了三个时代，没有容器化技术的演进就不会有 Docker 技术的诞生。

![img](https://img-blog.csdnimg.cn/img_convert/475e24c31d2da93680b96d2a7336d2c4.webp?x-oss-process=image/format,png)

（1）物理机时代：多个应用程序可能会跑在一台机器上。

![img](https://img-blog.csdnimg.cn/img_convert/0916b7628e07d602557ce535ef2c0c8c.webp?x-oss-process=image/format,png)

（2）虚拟机时代：一台物理机器安装多个虚拟机（VM），一个虚拟机跑多个程序。

![img](https://img-blog.csdnimg.cn/img_convert/248a1b507d97b7eb18679ffcb032fa2f.webp?x-oss-process=image/format,png)

（3）容器化时代：一台物理机安装多个容器实例（container），一个容器跑多个程序。

![img](https://img-blog.csdnimg.cn/img_convert/b80e797e98cc00de987783f7f00dcca7.webp?x-oss-process=image/format,png)

容器化解决了软件开发过程中一个令人非常头疼的问题，用一段对话描述：

```tex
测试人员：你这个功能有问题。
开发人员：我本地是好的啊。
```

开发人员编写代码，在自己本地环境测试完成后，将代码部署到测试或生产环境中，经常会遇到各种各样的问题。明明本地完美运行的代码为什么部署后出现很多 bug，原因有很多：不同的操作系统、不同的依赖库等，总结一句话就是因为本地环境和远程环境不一致。

容器化技术正好解决了这一关键问题，它将软件程序和运行的基础环境分开。开发人员编码完成后将程序打包到一个容器镜像中，镜像中详细列出了所依赖的环境，在不同的容器中运行标准化的镜像，从根本上解决了环境不一致的问题。

## 容器化技术的尖刀武器

![img](https://img-blog.csdnimg.cn/img_convert/b83e00ea4e5c2944ffa60399b9e305d6.webp?x-oss-process=image/format,png)

**可移植性：**不依赖具体的操作系统或云平台，比如在阿里云或腾讯云直接随意迁移。

**占地小：**容器只需要其应用程序以及它需要运行的所有容器和库的依赖清单，不需要将所有的依赖库都打包在一起。

**共享 bin 和 lib：**不同的容器可以共享 bin 和 lib，进一步节省了空间。、



Docker 横空出世
2010年一位年轻小伙子在美国旧金山成立了一家名叫【dotCloud】的公司， 开发了 Docker的核心技术，从此开启了容器技术的时代。

![img](https://img-blog.csdnimg.cn/img_convert/bb90d09ed21539b87b564db009daddfc.webp?x-oss-process=image/format,png)

后面 dotCloud 公司将自己的容器技术进行了简化和标准化，取名为 Docker，就是大家熟悉的鲸鱼 logo。

![img](https://img-blog.csdnimg.cn/img_convert/6252c0fe1be97e4026c5f2528947ec00.webp?x-oss-process=image/format,png)

2013年dotCloud 公司宣布将 Docker 开源，随着越来越多的工程师发现了它的优点， Docker 的人气迅速攀升，成为当时最火爆的开源技术之一。

当前有30％以上的企业在其AWS环境中使用Docker，并且这个数字还在继续增长。

![img](https://img-blog.csdnimg.cn/img_convert/f257f550dec36c0ded57803b917d18b8.webp?x-oss-process=image/format,png)

## Docker怎么用？

其实大多数人谈论 Docker 时说的是 Docker Engine，这只是一个构建和运行的容器。

在运行容器前需要编写Docker File，通过 dockerFile 生成镜像，然后才能运行 Docker 容器。

## 编排系统的需求催生 k8s

尽管Docker为容器化的应用程序提供了开放标准，但随着容器越来越多出现了一系列新问题：

- 如何协调和调度这些容器？

- 如何在升级应用程序时不会中断服务？
- 如何监视应用程序的运行状况？
- 如何批量重新启动容器里的程序？

解决这些问题需要容器编排技术，可以将众多机器抽象，对外呈现出一台超大机器。现在业界比较流行的有：k8s、Mesos、Docker Swarm。

在业务发展初期只有几个微服务，这时用 Docker 就足够了，但随着业务规模逐渐扩大，容器越来越多，运维人员的工作越来越复杂，这个时候就需要编排系统解救opers。

![img](https://img-blog.csdnimg.cn/img_convert/ff0846c78c24966c89741b4190434a72.webp?x-oss-process=image/format,png)


一个成熟的容器编排系统需要具备以下能力：

- 处理大量的容器和用户

- 负载均衡

- 鉴权和安全性

- 管理服务通信

- 多平台部署


## k8s与Docker Swarm江湖恩怨

![img](https://img-blog.csdnimg.cn/img_convert/6dd476286a3288ee8ffd6e8411198c56.webp?x-oss-process=image/format,png)


如果你非要拿 Docker 和 k8s 进行比较，其实你更应该拿 Docker Swarm 和 k8s 比较。

Docker Swarm 是 Docker 自家针对集群化部署管理的解决方案，优点很明显，可以更紧密集成到 Docker 生态系统中。

虽说 Swarm 是 Docker 亲儿子，但依旧没有 k8s 流行，不流行很大程度是因为商业、生态的原因，不多解释。

## k8s是做什么用的？

K8s是Google研发的容器协调器，已捐赠给CNCF，现已开源。

Google 利用在容器管理多年的经验和专业知识推出了 k8s，主要用于自动化部署应用程序容器，可以支持众多容器化工具包括现在非常流行的Docker。

目前k8s 是容器编排市场的领导者，开源并公布了一系列标准化方法，主流的公有云平台都宣布支持。

一流的厂商都在抢占标准的制高点，一堆小厂商跟着一起玩，这就叫生态了。国内的大厂商都在干嘛呢？抢社区团购市场，玩资本游戏，哎？！

## K8s 架构和组件

k8s 由众多组件组成，组件间通过 API 互相通信，归纳起来主要分为三个部分：

- controller manager

- nodes

- pods


![img](https://img-blog.csdnimg.cn/img_convert/19c66ce802fc42e19cfbe2e52a07f3c7.webp?x-oss-process=image/format,png)

- Controller Manager，即控制平面，用于调度程序以及节点状态检测。
- Nodes，构成了Kubernetes集群的集体计算能力，实际部署容器运行的地方。

- Pods，Kubernetes集群中资源的最小单位。


## Docker与k8s 难舍难分

Docker 和 k8s 在业界非常流行，都已经是事实上的标准。

Docker 是用于构建、分发、运行容器的平台和工具。

而 k8s 实际上是一个使用 Docker 容器进行编排的系统，主要围绕 pods 进行工作。Pods 是 k8s 生态中最小的调度单位，可以包含一个或多个容器。

Docker 和 k8s 是根本上不同的技术，两者可以很好的协同工作。

# 开发实践，灵魂追问

## （1）没有 k8s 可以使用 docker 吗？

可以。实际上一些小型公司，在业务不太复杂的情况下都是直接使用 Docker。尽管 k8s 有很多好处，但是众所周知它非常复杂，业务比较简单可以放弃使用 k8s。

## （2）没有 Docker 可以使用 k8s 吗？

k8s 只是一个容器编排器，没有容器拿什么编排？！

k8s 经常与 Docker 进行搭配使用，但是也可以使用其他容器，如RunC、Containerted 等。

## （3）Docker Swarm 和 k8s 怎么选？

选 k8s。2019年底Docker Enterprise已经出售给Mirantis，Mirantis声明要逐步淘汰Docker Swarm，后续会将 k8s 作为默认编排工具。

