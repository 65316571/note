# Oracle安装教程：

## 服务器端：

### 1、先安装	——>	微软常用运行库合集 2024.03.13

### 2、再安装	——>	Oracle19c系统安装包 

<img src="https://start-haohao.oss-cn-shanghai.aliyuncs.com/PigGo/Oracle%E5%AE%89%E8%A3%85%E6%95%99%E7%A8%8B20250428104936731.png" alt="3" style="zoom:67%;" />

安装时可以根据下方的参考资料1进行操作（注意不要解压到中文目录，并且解压后的文件夹也不能为中文）

### 3、测试连接	——>	是否安装成功		

​		搜索中打开 SQL Plus	输入对应的账号密码

​		本地登录没有问题后，准备连接远程



### 4、修改配置	——>	服务器开放1521端口与云服务安全组

```shell
-- 一键添加防火墙规则:
netsh advfirewall firewall add rule name="Oracle 1521" dir=in action=allow protocol=TCP localport=1521
-- 验证规则是否生效：
netsh advfirewall firewall show rule name="Oracle 1521"
```



【云服务安全组】操作流程：

```
1. 登录阿里云控制台
访问 阿里云ECS控制台
找到您的实例，点击实例ID进入详情页。

2. 检查安全组规则
在实例详情页，找到 “安全组” 标签页。
点击安全组ID进入规则配置界面。

3. 添加安全组规则（若缺失）
点击 “配置规则” → “手动添加”：
规则方向：入方向
授权策略：允许
协议类型：TCP
端口范围：1521
授权对象：0.0.0.0/0（允许所有IP）或指定您的客户端IP（如 121.40.205.175/32）
优先级：1（数值越小优先级越高）

4.保存规则。
```



​	找到listener.ora 与 tnsanames.ora 两个文件 

我的目录在【C:\Users\Administrator\Desktop\product\network\admin\sample】

IP地址：121.40.205.175（按需修改）

port端口：1521

数据库名称：oral



### `listener.ora` - 监听器配置文件

- **定义监听器行为**：配置数据库监听器的IP、端口、协议和接收的请求类型。
- **服务注册**：指定监听器管理的数据库实例和服务名（静态注册）。
- **安全控制**：设置访问权限、日志和跟踪选项。

listener.ora

```
# 精简版 listener.ora 配置
LISTENER =
  (DESCRIPTION_LIST =
    (DESCRIPTION =
      # 监听所有网络接口的TCP连接
      (ADDRESS = (PROTOCOL = TCP)(HOST = 0.0.0.0)(PORT = 1521))
      # 本地IPC连接（保留）
      (ADDRESS = (PROTOCOL = IPC)(KEY = EXTPROC1521))
    )
  )

# 服务注册配置
SID_LIST_LISTENER =
  (SID_LIST =
    (SID_DESC =
      (GLOBAL_DBNAME = oral)      # 全局数据库名
      (ORACLE_HOME = %ORACLE_HOME%) # 使用环境变量
      (SID_NAME = oral)           # 数据库实例名
      (ENVS = "TNS_ADMIN=%ORACLE_HOME%\network\admin") # 设置TNS目录
    )
  )

# 监听器管理配置
PASSWORDS_LISTENER = (oracle)     # 监听器操作密码（建议使用lsnrctl加密）
SAVE_CONFIG_ON_STOP_LISTENER = ON # 停止时自动保存配置
CONNECT_TIMEOUT_LISTENER = 30     # 连接超时时间(秒)

# 日志配置
LOG_DIRECTORY_LISTENER = %ORACLE_HOME%\network\log
LOG_FILE_LISTENER = listener
TRACE_LEVEL_LISTENER = OFF        # 生产环境建议关闭跟踪
```



### `tnsnames.ora` - 客户端连接别名文件

- **定义连接描述符**：为客户端提供数据库服务的网络位置和连接参数。
- **简化连接**：通过别名（如 `ORAL`）替代复杂的连接字符串。
- **负载均衡/故障转移**：配置多地址列表实现高可用。

tnsnames.ora

```
# 标准单实例数据库连接配置
ORAL =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = 121.40.205.175)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = oral)
    )
  )

# 带连接超时和重试的配置
ORAL_WITH_TIMEOUT =
  (DESCRIPTION =
    (CONNECT_TIMEOUT = 10)(RETRY_COUNT = 2)
    (ADDRESS = (PROTOCOL = TCP)(HOST = 121.40.205.175)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = oral)
    )
  )
```

<img src="https://start-haohao.oss-cn-shanghai.aliyuncs.com/PigGo/Oracle%E5%AE%89%E8%A3%85%E6%95%99%E7%A8%8B20250428104804310.png" alt="3" style="zoom:67%;" />



### 5、测试连接 ——> 本地测试是否成功

如果没有安装TeInet 在搜索中搜索：【程序】 选中 TeInet Client

<img src="https://start-haohao.oss-cn-shanghai.aliyuncs.com/PigGo/Oracle%E7%8E%AF%E5%A2%8320250428143631944.png" alt="1" style="zoom:50%;" />

```shell
ping XXX.XXX.XXX.XXX

telnet XXX.XXX.XXX.XXX 1521
```



### 6、配置连接环境——>安装OCI环境

​		解压【Oracle19c 核心组件的轻量级包】，移动至任意路径。

​		打开Navicat > 点击选项 > 选择环境 > 配置OCI环境 > 选中刚刚的路径（完成后需要重启Navicat）

### 7、开始连接	——>  配置连接

如图所示即可：

主机修改成对应IP地址

<img src="https://start-haohao.oss-cn-shanghai.aliyuncs.com/PigGo/Oracle%E7%8E%AF%E5%A2%8320250428143433521.png" alt="3" style="zoom:33%;" />



参考资料：

[Windows Server环境部署Oracle 19c_windows在服务器上部署oracle数据库](https://blog.csdn.net/ym5209999/article/details/142758516)

[不能打开到主机的连接，在端口1521:连接失败的解决方法](https://blog.csdn.net/bapinggaitianli/article/details/45972187)

[阿里云服务器开放端口设置（超详细）](https://developer.aliyun.com/article/1209367)

[Oracle Instant Client 下载](https://www.oracle.com/database/technologies/instant-client/downloads.html)