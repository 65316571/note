当今三大主流调度系统的比较与分析

- 对比总结

![img](https://pica.zhimg.com/80/v2-d9d1c38c3f3bdd4678e3920b0d2f7d1b_1440w.webp?source=1def8aca)

- Apache Mesos

Apache Mesos 是一个分布式系统内核的[开源集群管理器](https://www.zhihu.com/search?q=开源集群管理器&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra={"sourceType"%3A"answer"%2C"sourceId"%3A1961358160})，Apache Mesos 的出现要远早于 Docker Swarm 和 [Kubernetes](https://link.zhihu.com/?target=http%3A//mp.weixin.qq.com/s%3F__biz%3DMzI0MDQ4MTM5NQ%3D%3D%26mid%3D2247509555%26idx%3D2%26sn%3Df0b3649bf14efc4f85ca3914578caff8%26chksm%3De918c32fde6f4a39636f074405cd32c67cbb8d00c09940402d37c0eb14557c378bd679461b83%26scene%3D21%23wechat_redirect)。再加上 Marathon 这个基于容器的应用程序的编排框架，它为 Docker Swarm 和 Kubernetes 提供了一个有效的替代方案。Mesos 同时可以使用其他框架来同时支持[容器化](https://www.zhihu.com/search?q=容器化&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra={"sourceType"%3A"answer"%2C"sourceId"%3A1961358160})和非容器化的工作负载。

Mesos 能够在同样的集群机器上运行多种分布式系统类型，可以更加动态高效的共享资源。而且 Messos 也提供服务失败检查，服务发布，服务跟踪，服务监控，资源管理和资源共享。Messos 可以扩展伸缩到数千个节点。如果你拥有很多的服务器而且想构建一个大的集群的时候，Mesos 就派上用场了。很多的现代化可扩展性的数据处理应用都可以在 Mesos 上运行，包括[大数据框架](https://www.zhihu.com/search?q=大数据框架&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra={"sourceType"%3A"answer"%2C"sourceId"%3A1961358160}) Hadoop、[Kafka](https://link.zhihu.com/?target=http%3A//mp.weixin.qq.com/s%3F__biz%3DMzI0MDQ4MTM5NQ%3D%3D%26mid%3D2247511053%26idx%3D2%26sn%3D94e494c5bedf0da4ba422420cacb3ed7%26chksm%3De918c911de6f400737153e871fef36244dea9c2d7ee423ba89e27b659750b158a7b99aee7213%26scene%3D21%23wechat_redirect)、Spark。

但是大而全，往往就是对应的复杂和困难，这一点体现在 Messos 上是完全正确，与Docker 和 Docker Swarm 使用同一种 API 不同的，Mesos 和 Marathon 都有自己的 API，这使得它们比其他编排系统更加的复杂。Apache Mesos 是混合环境的完美编配工具，由于它包含容器和非容器的应用，虽然 Messos 很稳定，但是它的使用户快速学习应用变得更加困难，这也是在应用和部署场景下难于推广的原因之一。

- Docker Swarm

[Docker Swarm](https://link.zhihu.com/?target=http%3A//mp.weixin.qq.com/s%3F__biz%3DMzI0MDQ4MTM5NQ%3D%3D%26mid%3D2247487131%26idx%3D1%26sn%3Dab26a01288355ca29fe16a50346ec8cd%26chksm%3De91b6b87de6ce291af3ad05d9842b6ad45e62d9f9d86d7474a3f38f7ba8cc4feea9817d22060%26scene%3D21%23wechat_redirect) 是 Docker 公司的容器编排系统，使用的是标准 Docker API 接口，容器使用命令和 docker 命令是一套，简单方便。Docker Swarm 基本架构是也是简单直接，每个主机运行一个 Docker Swarm 代理，一个主机运行一个 Docker Swarm 管理者，这个管理者负责指挥和调度这些主机上的容器，Docker Swarm 以高可用性模式运行，Docker Swarm 中的一个节点充当其他节点的管理器，包括调度程序和服务发现组件的容器。

Docker Swarm 的优点和缺点都是使用标准的 Docker 接口，因为使用简单，容易集成到现有系统，所以在支持复杂的调度系统时候就会比较困难了，特别是在定制的接口中实现的调度。这也许就是成也在 Docker，败也在 Docker 的原因所在。

- Kubernetes

Kubernetes 作为一个[容器集群管理系统](https://www.zhihu.com/search?q=容器集群管理系统&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra={"sourceType"%3A"answer"%2C"sourceId"%3A1961358160})，用于管理云平台中多个主机上的容器应用，[Kubernetes](https://link.zhihu.com/?target=http%3A//mp.weixin.qq.com/s%3F__biz%3DMzI0MDQ4MTM5NQ%3D%3D%26mid%3D2247509120%26idx%3D2%26sn%3D7a1541742111f5faee1716aac58bbf28%26chksm%3De918c19cde6f488a1e67f9a83ced62449027412e90ab349027e458c9a68c15dfdadb2843db63%26scene%3D21%23wechat_redirect) 的目标是让部署容器化的应用变得简单且高效，所以 Kubernetes 提供了应用部署，规划，更新，维护的一整套完整的机制。

Kubernetes 没有固定要求容器的格式，但是 [Kubernetes](https://link.zhihu.com/?target=http%3A//mp.weixin.qq.com/s%3F__biz%3DMzI0MDQ4MTM5NQ%3D%3D%26mid%3D2247502359%26idx%3D1%26sn%3D8c16100c9731359b9864403183f44233%26chksm%3De918af0bde6f261da9f4960c0ed43e1552eeed9ff3ad0ba06bcfef75e3ba9e9d097e1c87a51c%26scene%3D21%23wechat_redirect) 使用它自己的 API 和命令行接口来进行容器编排。除了[ Docker 容器](https://link.zhihu.com/?target=http%3A//mp.weixin.qq.com/s%3F__biz%3DMzI0MDQ4MTM5NQ%3D%3D%26mid%3D2247486129%26idx%3D1%26sn%3D986d170f115071cbe676d211a0458008%26chksm%3De91b6fadde6ce6bb271dedda23acef2c031ee3bdd7d9e2034ceab9a9e2c65f2caa98932e9491%26scene%3D21%23wechat_redirect)之外，Kubernetes 还支持其他多种容器，如 rkt、CoreOS 等。Kubernetes 是自成体系的管理工具，可以实现容器调度，资源管理，服务发现，健康检查，自动伸缩，更新升级等，也可以在应用模版配置中指定副本数量，服务要求（IO 优先；性能优先等），资源使用区间，标签（Labels等）来匹配特定要求达到预期状态等，这些特征便足以征服开发者，再加上 Kubernetes 有一个非常活跃的社区。它为用户提供了更多的选择以方便用户扩展编排容器来满足他们的需求。但是由于 Kubernetes 使用了自己的 API 接口，所以命令系统是另外一套系统，这也是 kubernetes 门槛比较高的原因所在。

大部分的应用程序我们在部署的时候都会适当的添加监控，对于运行载体容器则更应该如此。[kubernetes](https://www.zhihu.com/search?q=kubernetes&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra={"sourceType"%3A"answer"%2C"sourceId"%3A1961358160}) 提供了 liveness probes 来检查我们的应用程序，它是由节点上的 kubelet 定期执行的。






![img](https://picx.zhimg.com/80/v2-8eab1606a489aa28545ed7f984f80b01_1440w.webp?source=1def8aca)

Docker, Kubernetes, 容器的繁荣未来

### 背景

今年在系统学习 Kubernetes 的时候，发现 [k8s](https://www.zhihu.com/search?q=k8s&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra={"sourceType"%3A"answer"%2C"sourceId"%3A2702169135}) 为了进一步模块化、兼容化各种云平台和容器运行时，有非常多个接口规范和标准。同时正式的将 Docker 移除，将 containerd 作为默认的容器运行时。因此，为了搞清楚[容器变迁](https://www.zhihu.com/search?q=容器变迁&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra={"sourceType"%3A"answer"%2C"sourceId"%3A2702169135})中的前因后果，画了一张全景图来分析和归纳各个技术之间的关系和变迁。

*（大部分信息都在图中，因此文字仅作为导读）
（图文带有主观认知，难免会有错误和误解，仅作学习参考）*

### 天空一声巨响，Docker 闪亮登场

![img](https://pica.zhimg.com/80/v2-2e5bff692825013e0537ec33fc1bde8e_1440w.webp?source=1def8aca)

Docker 的核心能力 namespace、[cgroup](https://www.zhihu.com/search?q=cgroup&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra={"sourceType"%3A"answer"%2C"sourceId"%3A2702169135}) 其实早在 08 年前就已经被广泛的运用在 linux 系统上。而当时，提供 “代码和依赖一致” 的能力，也并非是容器首创的。而 Docker 能够打败 Cloud Foundry，靠的其实是 AUFS —— 通过[分层文件](https://www.zhihu.com/search?q=分层文件&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra={"sourceType"%3A"answer"%2C"sourceId"%3A2702169135})打造镜像，保证了系统环境的统一。即 代码（应用程序）+ 依赖（后端服务）+ 系统（操作系统） 三位一体，保证了运行的一致性。

![img](https://picx.zhimg.com/80/v2-23eda6e9882ef84ac4f92543079b3f39_1440w.webp?source=1def8aca)

加之，Docker 还通过 Cli + Docker Hub 的模式，便捷且友好的交互模式降低了容器的准入门槛，赢得了开发者就赢得了未来。（同 Github）

### Kubernetes vs Docker Swarm

![img](https://pic1.zhimg.com/80/v2-ec7c2c677631f7fcb616166676501d43_1440w.webp?source=1def8aca)

当 Docker 完成了单机运行环境的大一统后，就开始计划抢夺各大云厂商的饭碗 —— PaaS 和[容器编排](https://www.zhihu.com/search?q=容器编排&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra={"sourceType"%3A"answer"%2C"sourceId"%3A2702169135})。不过，各大云厂（AWS、Azure、GCP、VMWare）背后站的可都是 IT 行业的话事人，不会这么轻易的让出这块蛋糕。因此，2014 年左右，发生了 2 件事改变了 Docker 的命运。

Kubernetes 横空出世，带着 Google 的光环一出场就吸引了全场目光，随后一路走高直接干趴了 DockerSwarm。
OCI 组织成立（Google Redhat 发起），开始定义各种容器标准，随后 Docker 开始拆分自身组件、实现各式标准和对接各种平台。runc, containerd 在受到社区追捧被更多工具使用时，Docker 这个软件却被慢慢遗忘了，最后只剩下 “docker” 这样一个容器的代称了。

*（如果 Docker 不加入 OCI、不实现标准、不捐赠 runc，现在会是怎么样呢
（最近 Istio 终于也加入 CNCF 了 ...*

### OCI 开放容器接口

![img](https://picx.zhimg.com/80/v2-505c8cfaeac6e5042330af60890c9813_1440w.webp?source=1def8aca)

Linux 基金会下的 OCI 定义了 Runtime（运行时） + Image（镜像）标准，以便根据用户的使用情况选择不同的容器运行时，如 能基于 hypervisor 提供强隔离性的 KataContainer，基于系统调用拦截的 gVistor 等。

“OCI 容器” 通常是指的容器运行时，即如何创建容器、管理镜像的底层功能。

### Kubernetes 占领高地

![img](https://pica.zhimg.com/80/v2-98750bc5070732faf351a1e71fd8d7a9_1440w.webp?source=1def8aca)

Kubernetes 通过开源运作不断吸引开发者，开发者影响技术决策，从而逐渐占据企业市场，最终赢得了容器编排大战的胜利，当前 k8s 以成为容器编排的事实标准，AWS、Cloud Foundry 这些在容器之前就已经有 PaaS 平台能力的云厂，份额也在不断的被 k8s 蚕食。

k8s 本质是一个 PaaS 平台，为了对接不同的实现，比如 容器运行时、网络传输、[云服务组件](https://www.zhihu.com/search?q=云服务组件&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra={"sourceType"%3A"answer"%2C"sourceId"%3A2702169135})，也抽象出了很多接口，即 CRI、CNI、CSI、CCM 等。

为什么剔除 Docker（dockerd） 也是因为对于 k8s 来说，并不需要 Docker 的上层功能，仅需要能够操纵容器的运行时组件即可。而这部分能力恰好就是在 Docker 演进过程中，被拆分出来的 [containerd](https://www.zhihu.com/search?q=containerd&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra={"sourceType"%3A"answer"%2C"sourceId"%3A2702169135})。因此 containerd 被纳入到 CRI 标准中，随后被捐赠给 CNCF，作为 k8s 默认的容器运行时实现。

### “容器运行时”

我们在翻阅文档时，通常会看到两种容器运行时：

- CRI 是为支持 k8s 工作而定义的，主要目的是调用底层运行时来构建 pod = [多容器](https://www.zhihu.com/search?q=多容器&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra={"sourceType"%3A"answer"%2C"sourceId"%3A2702169135})、共享网络和存储
- OCI 则相对更底层一点，主要目的是调用内核功能来构建容器

有一种说法是 containerd 等用于支持 k8s 等 PaaS 平台功能的运行时，被称为 High-Level 运行时，除了容器、镜像外，还拥有管理网络、存储等能力。而 runc 这种直接对接操作系统内核，只关注于容器本身的即为 Low-Level 运行时。

### Shim

Shim 也是一个常出现但让人误解的词，在翻阅了一些资料后，我发现 “Shim - 垫片” 就是一个技术词汇，出现在各处的定义不同。

![img](https://pica.zhimg.com/80/v2-c48f1605cadaf38cb90e1222da20aa51_1440w.webp?source=1def8aca)

在 docker 的语境下，shim 指的是 mangager(containerd) -> container(runc) 这一层

![img](https://pica.zhimg.com/80/v2-556e53e5bd8477861db967326775af6e_1440w.webp?source=1def8aca)

在 k8s 的语境下，shim 指的是 CRI client(kubelet) -> runtime(docker/containerd) 这一层

*因为一开始 k8s 只支持 docker，所以使用 dockershim 做了一层桥接；而后使用 CRI-containerd 操作时，其实就不存在 shim 这一层了*

![img](https://picx.zhimg.com/80/v2-6a94ea5611ac846c8064fc1b2998da30_1440w.webp?source=1def8aca)

在 containerd 的语境下，shim 指的是 OCI client(containerd) -> runtime(runc) 这一层



### 参考资料

- [9000字长文复盘Docker兴衰，从容器大战史推演基础软件投资](https://link.zhihu.com/?target=https%3A//mp.weixin.qq.com/s%3F__biz%3DMzkzMTM1MDEyOA%3D%3D%26mid%3D2247483673%26idx%3D1%26sn%3D405f481ab19f928bb85add017201fb1c%26chksm%3Dc26d1206f51a9b107de1d80d91e29c4e7c6c6edaa6e6809b0040ee3aa08c1524563b8cd43ac8%26mpshare%3D1%26scene%3D1%26srcid%3D05304k7ldEAcPcXbuNW6G4Lu%26sharer_sharetime%3D1653886191829%26sharer_shareid%3Dd1c27a97d2ae54cfe57aae2b6d670930%23rd)
- [Dockershim：历史背景](https://link.zhihu.com/?target=https%3A//kubernetes.io/zh-cn/blog/2022/05/03/dockershim-historical-context/)
- 容器江湖的爱恨情仇 - Thoughtworks中国的文章 - 知乎 https://zhuanlan.zhihu.com/p/523574407
- [Kubernetes容器平台，从繁荣走向碎片化](https://link.zhihu.com/?target=https%3A//mp.weixin.qq.com/s%3F__biz%3DMzI5ODQ2MzI3NQ%3D%3D%26mid%3D2247507046%26idx%3D1%26sn%3D1c8f205730fb3b7b9519725b7d7730d0%26chksm%3Deca7e522dbd06c34be089b740b710238168da8009b111a44deadc89f08ea98b31a466d9dd95e%26mpshare%3D1%26scene%3D1%26srcid%3D0405CZnlY42ne6yorySr9VG5%26sharer_sharetime%3D1649166099552%26sharer_shareid%3Dd1c27a97d2ae54cfe57aae2b6d670930%23rd)
- [Kubernetes: The Documentary [PART 1\]](https://link.zhihu.com/?target=https%3A//www.youtube.com/watch%3Fv%3DBE77h7dmoQU)
- [Kubernetes: The Documentary [PART 2\]](https://link.zhihu.com/?target=https%3A//www.youtube.com/watch%3Fv%3D318elIq37PE)
- [K8s宣布弃用Docker，千万别慌！](https://link.zhihu.com/?target=https%3A//mp.weixin.qq.com/s/GHjvvTJ8ZerIyCqXB1BSUQ)