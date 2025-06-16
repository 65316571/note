# 常用目录结构：

/bin        二进制文件，系统常规命令
/boot       系统启动分区，系统启动时读取的文件
/dev        设备文件
/etc        大多数配置文件
/home       普通用户的家目录
/lib        32位函数库
/lib64      64位库
/media      手动临时挂载点
/mnt        手动临时挂载点
/opt        第三方软件安装位置
/proc       进程信息及硬件信息
/root       临时设备的默认挂载点
/sbin       系统管理命令
/srv        数据
/var        数据
/sys        内核相关信息
/tmp        临时文件
/usr        用户相关设定



# Linux常用命令组

clear 	 清空屏幕

date 	 系统查看时间

​		修改时间【date -s 'yyyy-MM-dd	hh-mm-ss'】

Ctrl+l		清屏【上滑可以看历史】

su		  切换用户

exit		退出当前用户

Tab 		补全

./命令文件.sh	执行Shell命令

Ctrl+c 	强制中断程序的执行

Ctrl+z 	将任务中止（暂停的意思）

### 文件上传（下载）	

sz：将选定的文件发送（send）到本地机器

rz：运行该命令会弹出一个文件选择窗口，从本地选择文件上传到Linux服务器

注：【Xshell独有】

### 移动文件：

mv   路径/文件名	移动后的路径/

mv   路径/文件名	移动后的路径/移动后的名字

### 压缩解压：

zip -r 压缩文件名字.zip /所选文件路径		[./即为当前目录所有文件]

unzip 解压文件名

tar -xvf 解压名字

### 增加权限:

chmod 755 文件名	

### 创建文件：

touch 文件名.后缀名

### 删除文件:

rm  -rf 删除名字

### 查看文件:

ll 查看文件（不包括隐藏文件）

ll -a 查看所有文件（包括隐藏文件）

### 搜索文件：

find  -@  -条件

@可以为：size、mtime、name、type

可以根据大小、时间、名字、类型

【使用前先切换到查询目录】

### 复制文件：

cp 文件名	复制文件

cp -a 文件名，选项a表示文件的属性也复制、目录下所有文件都复制

### 创建文件夹&删除文件夹

mkdir	新增名字

rmdir	删除名字(只能为空)

### 查看历史命令：

history							【查看历史】

### 开放端口号权限

/sbin/iptables -I INPUT -p tcp --dport 8080 -j ACCEPT			

# 常见问题以及解决

1、获取IP地址路径：如果ifconfig查询不出ip地址

输入：sudo dhclient ens33	【重新获取IP】

- dhclient -r ens33 # 释放IP
- dhclient ens33 # 获取IP





# Linux系统命令行的含义

- ### 示例：root@app00:~# 

- root    //用户名，root为超级用户

- @       //分隔符

- app00   //主机名称

- ~ //当前所在目录，默认用户目录为~，会随着目录切换而变化，例如：（root@app00:/bin# ，当前位置在bin目录下）

- '#' //表示当前用户是超级用户，普通用户为$，例如：（"yao@app00:/root$" ，表示使用用户"yao"访问/root文件夹）

# 常用命令：

**1、cd**

- cd是change directory的缩写，切换工作目录
- cd ~，切换到用户主目录
- cd ..，切到上一级目录
- cd -，切到上一次所在的目录
- cd /，切到系统根目录
- cd /usr，切到usr目录

**2、ls**

- ls是list的缩写，列出当前目录下的文件及文件夹列表信息
- ls -a，all列出当前目录下所有文件，包括以“.”开头的隐藏文件
- ls -l，long listing format，缩写成ll，列出明细列表信息
- ls -l *.db，列出以.db结尾的文件的详细信息，*为通配符代表任意多个字符

**3、ll**

- ll是long listing format的缩写，列出当前位置文件及文件夹的明细列表，包括隐藏文件。

**4、pwd**

- pwd是print working directory的缩写，打印当前工作目录

**5、file**

- 语法：file 文件或目录

- 显示文件的类型（directory、data、text、zip、shell等）

**6、mkdir**

- mkdir是make directory的缩写，创建目录
- mkdir -p  dir1/dir2，-p选项表示父目录，当父目录不存在时，同时创建父目录，也就是递归创建目录。

**7、touch**

- 例如：touch a.txt，创建文件a.txt

**8、rm**

- rm是remove的缩写，删除文件
- rm -r 目录或文件，recursion递归删除，删除目录及目录下所有文件，非空也可以删除
- rm -f 目录或文件，强制删除
- rm -rf * ，强制删除当前目录下所有文件

**9、rmdir**

- rmdir是remove directory的缩写，删除空目录

**10、mv**

- mv是move的缩写，可以用来剪切文件目录或者将文件改名
- 语法：mv 源文件 目标文件或目录
- mv dir1 dir2，移动一个文件到指定目录（目标文件存在即移动源文件到指定目录）
- mv dir1 dir2，重命名一个文件或者目录（目标文件不存在就是更改文件名）
- mv /a/a.txt /b/b.txt ：移动a目录下的a.txt到b目录下，并改名为b.txt
- mv /b/b.txt /b/c ：移动b目录下的b.txt到b目录下的c目录下

**10、mv**

- mv是move的缩写，可以用来剪切文件目录或者将文件改名
- 语法：mv 源文件 目标文件或目录
- mv dir1 dir2，移动一个文件到指定目录（目标文件存在即移动源文件到指定目录）
- mv dir1 dir2，重命名一个文件或者目录（目标文件不存在就是更改文件名）
- mv /a/a.txt /b/b.txt ：移动a目录下的a.txt到b目录下，并改名为b.txt
- mv /b/b.txt /b/c ：移动b目录下的b.txt到b目录下的c目录下

**11、cp**

- cp是copy的缩写，复制文件
- cp -a，选项a表示文件的属性也复制、目录下所有文件都复制
- cp -i，选项i表示覆盖前询问
- 例如：cp -ai  dir1  dir2

# 文件处理命令：

**1、cat**

- cat是concatenate的缩写，原意是连接和打印文件。
- cat的作用是显示文件内容，不可以进行修改。

**2、vi**

- vi是visual的缩写，（单词原意是可视的），创建并打开编辑文件
- :wq，write、quit，写文件后退出
- :wq!，强制性退出

**3、vim**

- vim是visual improved的缩写，vim就是vi命令的提升改进版。作用就是编辑查看文件。

**4、head**

- head是“头”的意思。
- 该命令是显示文件头n行内容
- 语法结构：head [-n] 文件名
- -n指定显示多少行
- 例如：head -n 10 file.txt

**5、tail**

- tail是“尾巴”的意思。
- 该命令是显示文件末尾几行内容
- 语法结构：tail [-nf] 文件名
- -n指定显示多少行，没有-n默认10行
- -f用于实时追踪文件的所有更新
- 常用于查阅正在改变的日志文件
- 例如:tail -f -n 3 file.log
- 表示开始显示最后3行，并在文件更新时实时追加显示

**6、sed**

- sed是个人名赛德。sed 是一种Linux在线编辑器，或许该编辑器的作者叫做塞德，所以命令就是sed。
- 例如：sed -n '10,$p' file.txt
- 表示显示第10行到最后一行；
- $表示最后一行；
- 例如：sed -n '/搜索的关键词/p' file.txt
- 表示显示包括关键词所在行

# 文件查找

**1、find**

find的意思是查找，找到的意思。

1）、按照修改时间查找

- find  -mtime -1

- 表示查找当前目录下最近1天内（也就是1*24小时）修改过的文件

2）、按照尺寸查找

- find   -size -1M

- 查找当前目录下小于1M的文件

3）、按照文件类型查找

- find   -type f

- find   -type d

- 查找当前目录下的文件或目录（f为普通文件，d为目录）

4）、按照文件名称查找

- find   -name '*.txt'

- 查找当前目录下的文件或目录（f为普通文件，d为目录）

5）、查找到文件后执行操作

- find   -mtime +2 -exec rm {} \;

- -exec 命令 {} \表示对查出文件操作

6)、按照文件名和文件内容查找

- find   -name '*.txt'|grep -i 'Josh'   -r 

**2、grep**

Grep是个人名，格雷普。

grep是UNIX工具程序，该程序可以实现文件内的字符串查找。

1）、查找指定目录或子目录下包含特定字符串的文件

- grep -i 'steven'  -r -n

- 表示在当前目录及子目录下查找文件内容包含“steven”的文件

- -i表示不区分大小写；

- -r表示递归查找

# 文件权限

了解即可

# 压缩解压

**1、tar**

tar是tape archive的缩写，tape是磁带、录音的意思，archive是把…存档的意思。

tape archive的意思就是：把文件打包到磁带中存档。打包就是将多个文件包成一个大文件。

选项有：zxvf、zcvf、jxvf、jcvf

-z：字母z表示处理tar.gz文件；

-x：字母x来自单词extract，extract是提取、提炼的意思。-x表示解压缩；

-v：字母v来自单词verbose。verbose是冗长的；啰嗦的意思。-v选项就是显示信息为详细模式的意思；

-c：字母c来自单词compress，compress压缩的意思。-c表示压缩文件；

-j：字母j表示处理bzip2格式（后缀为tar.bz2）的文件；

-f：字母f就是file的意思。

-zxvf：含义就是对tar.gz文件进行解压缩，显示信息为详细模式。

-zcvf：含义就是对tar.gz文件进行压缩，显示信息为详细模式。

-jxvf：含义就是对bzip2文件进行解压缩，显示信息为详细模式。

-jcvf：含义就是对bzip2文件进行压缩，显示信息为详细模式。

-C选项后面跟一个参数，该参数是指定解压或压缩到某个目录的意思。

1)、tar -zxvf file.tar.gz -C  test

解压tar.gz到当前目录下的test子目录中

2)、tar -zcvf /dir2/file.tar.gz  dir1/

压缩tar.gz（把当前目录下的dir1目录及子目录下所有文件压缩到dir2目录下，文件名为file.tar.gz。

当使用tar -zxvf file.tar.gz解压出来时，就带有目录dir1）

3)、tar -jxvf file.tar.bz2

解压tar.bz2到当前目录下

4)、tar -jcvf file.tar.bz2  dir1/

压缩tar.bz2（把当前目录下的dir1目录及子目录下所有文件压缩到当前目录下，文件名为file.tar.gz2）



**2、zip**

压缩zip文件。

1)、zip -r file.zip  dir1/

压缩zip(把当前目录下的dir1目录及子目录下所有文件压缩到当前目录下，文件名为file.zip

3、unzip

解压zip文件。

1)、unzip file.zip

解压zip文件到当前目录中

2)、unzip -o mdmtest.war -d /opt/mdm

推荐使用unzip解压war包

-o来自单词overwrite，覆盖的意思。-o覆盖原有文件；

-d来自单词directory，-d指定文件解压后存储的目录。



# 常用基本命令

## 系统操作

#### 1、关闭系统：

```
(1)立刻关机
  shutdown -h now 或者 poweroff
(2)两分钟后关机
  shutdown -h 2
```

#### 2、系统重启：

```
(1)立刻重启
  shutdown -r now 或者 reboot
(2)两分钟后重启
  shutdown -r 2 
```

## 目录操作

#### 3、切换目录

```
  cd /                 //切换到根目录
  cd /bin              //切换到根目录下的bin目录
  cd ../               //切换到上一级目录 或者使用命令：cd ..
  cd ~                 //切换到home目录
  cd -                 //切换到上次访问的目录
  cd xx(文件夹名)       //切换到本目录下的名为xx的文件目录，如果目录不存在报错
  cd /xxx/xx/x         //可以输入完整的路径，直接切换到目标目录，输入过程中可以使用tab键快速补全
```

#### 4、查看目录

```
  ls                   //查看当前目录下的所有目录和文件
  ls -a                //查看当前目录下的所有目录和文件（包括隐藏的文件）
  ls -l                //列表查看当前目录下的所有目录和文件（列表查看，显示更多信息），与命令"ll"效果一样
  ls /bin              //查看指定目录下的所有目录和文件 
```

#### 5、创建目录

```
  mkdir tools          //在当前目录下创建一个名为tools的目录
  mkdir /bin/tools     //在指定目录下创建一个名为tools的目录
```

#### 6、删除目录

```
  rm 文件名              //删除当前目录下的文件
  rm -f 文件名           //删除当前目录的的文件（不询问）
  rm -r 文件夹名         //递归删除当前目录下此名的目录
  rm -rf 文件夹名        //递归删除当前目录下此名的目录（不询问）
  rm -rf *              //将当前目录下的所有目录和文件全部删除
  rm -rf /*             //将根目录下的所有文件全部删除【慎用！相当于格式化系统】
```

#### 7、修改目录【移动目录】

```
  mv 当前目录名 新目录名        //修改目录名，同样适用与文件操作
  mv /usr/tmp/tool /opt       //将/usr/tmp目录下的tool目录剪切到 /opt目录下面
  mv -r /usr/tmp/tool /opt    //递归剪切目录中所有文件和文件夹
```

#### 8、拷贝目录

```
  cp /usr/tmp/tool /opt       //将/usr/tmp目录下的tool目录复制到 /opt目录下面
  cp -r /usr/tmp/tool /opt    //递归剪复制目录中所有文件和文件夹
```

#### 9、搜索目录

```
  find /bin -name 'a*'        //查找/bin目录下的所有以a开头的文件或者目录
```

## 文件操作

#### 10、新增文件

```
   touch  a.txt				//在当前目录下创建名为a的txt文件（文件不存在），
   							//如果文件存在，将文件时间属性修改为当前系统时间
```

#### 11、删除文件

```
  rm 文件名              //删除当前目录下的文件
  rm -f 文件名           //删除当前目录的的文件（不询问）
```

#### 12、编辑文件

```
  vi 文件名              //打开需要编辑的文件
  --进入后，操作界面有三种模式：命令模式（command mode）、插入模式（Insert mode）和底行模式（last line mode）
  命令模式
  -刚进入文件就是命令模式，通过方向键控制光标位置，
  -使用命令"dd"删除当前整行
  -使用命令"/字段"进行查找
  -按"i"在光标所在字符前开始插入
  -按"a"在光标所在字符后开始插入
  -按"o"在光标所在行的下面另起一新行插入
  -按"："进入底行模式
  插入模式
  -此时可以对文件内容进行编辑，左下角会显示 "-- 插入 --""
  -按"ESC"进入底行模式
  底行模式
  -退出编辑：      :q
  -强制退出：      :q!
  -保存并退出：    :wq
  ## 操作步骤示例 ##
  1.保存文件：按"ESC" -> 输入":" -> 输入"wq",回车     //保存并退出编辑
  2.取消操作：按"ESC" -> 输入":" -> 输入"q!",回车     //撤销本次修改并退出编辑
  ## 补充 ##
  vim +10 filename.txt                   //打开文件并跳到第10行
  vim -R /etc/passwd                     //以只读模式打开文件
```

#### 13、查看文件

```
  cat a.txt          //查看文件最后一屏内容
  less a.txt         //PgUp向上翻页，PgDn向下翻页，"q"退出查看
  more a.txt         //显示百分比，回车查看下一行，空格查看下一页，"q"退出查看
  tail -100 a.txt    //查看文件的后100行，"Ctrl+C"退出查看
```

## 文件权限

#### 14、权限说明

```
  文件权限简介：'r' 代表可读（4），'w' 代表可写（2），'x' 代表执行权限（1），括号内代表"8421法"
  ##文件权限信息示例：-rwxrw-r--
  -第一位：'-'就代表是文件，'d'代表是文件夹
  -第一组三位：拥有者的权限
  -第二组三位：拥有者所在的组，组员的权限
  -第三组三位：代表的是其他用户的权限
```

#### 15、文件权限

```
  普通授权    chmod +x a.txt    
  8421法     chmod 777 a.txt     //1+2+4=7，"7"说明授予所有权限
```

## 打包与解压

#### 16、说明

```
  .zip、.rar        //windows系统中压缩文件的扩展名
  .tar              //Linux中打包文件的扩展名
  .gz               //Linux中压缩文件的扩展名
  .tar.gz           //Linux中打包并压缩文件的扩展名
```

#### 17、打包文件

```
  tar -zcvf 打包压缩后的文件名 要打包的文件
  参数说明：z：调用gzip压缩命令进行压缩; c：打包文件; v：显示运行过程; f：指定文件名;
  示例：
  tar -zcvf a.tar file1 file2,...      //多个文件压缩打包
```

#### 18、解压文件

```
  tar -zxvf a.tar                      //解包至当前目录
  tar -zxvf a.tar -C /usr------        //指定解压的位置
  unzip test.zip             //解压*.zip文件 
  unzip -l test.zip          //查看*.zip文件的内容 
```

## 其他命令

#### 19、find

```
  find . -name "*.c"     //将目前目录及其子目录下所有延伸档名是 c 的文件列出来
  find . -type f         //将目前目录其其下子目录中所有一般文件列出
  find . -ctime -20      //将目前目录及其子目录下所有最近 20 天内更新过的文件列出
  find /var/log -type f -mtime +7 -ok rm {} \;     //查找/var/log目录中更改时间在7日以前的普通文件，并在删除之前询问它们
  find . -type f -perm 644 -exec ls -l {} \;       //查找前目录中文件属主具有读、写权限，并且文件所属组的用户和其他用户具有读权限的文件
  find / -type f -size 0 -exec ls -l {} \;         //为了查找系统中所有文件长度为0的普通文件，并列出它们的完整路径
```

#### 20、whereis

```
  whereis ls             //将和ls文件相关的文件都查找出来
```

#### 21、which

```
  说明：which指令会在环境变量$PATH设置的目录里查找符合条件的文件。
  which bash             //查看指令"bash"的绝对路径
```

#### 22、sudo

```
  说明：sudo命令以系统管理者的身份执行指令，也就是说，经由 sudo 所执行的指令就好像是 root 亲自执行。需要输入自己账户密码。
  使用权限：在 /etc/sudoers 中有出现的使用者
  sudo -l                              //列出目前的权限
  $ sudo -u yao vi ~www/index.html  //以 yao 用户身份编辑  home 目录下www目录中的 index.html 文件
```

#### 23、grep

```
  grep -i "the" demo_file              //在文件中查找字符串(不区分大小写)
  grep -A 3 -i "example" demo_text     //输出成功匹配的行，以及该行之后的三行
  grep -r "ramesh" *                   //在一个文件夹中递归查询包含指定字符串的文件
```

#### 24、service

```
  grep -i "the" demo_file              //在文件中查找字符串(不区分大小写)
  grep -A 3 -i "example" demo_text     //输出成功匹配的行，以及该行之后的三行
  grep -r "ramesh" *                   //在一个文件夹中递归查询包含指定字符串的文件
```

#### 25、free

```
  说明：这个命令用于显示系统当前内存的使用情况，包括已用内存、可用内存和交换内存的情况 
  free -g            //以G为单位输出内存的使用量，-g为GB，-m为MB，-k为KB，-b为字节 
  free -t            //查看所有内存的汇总
```

#### 26、top

```
  top               //显示当前系统中占用资源最多的一些进程, shift+m 按照内存大小查看
```

#### 27、df

```
  说明：显示文件系统的磁盘使用情况
  df -h            //一种易看的显示
```

#### 28、mount

```
  mount /dev/sdb1 /u01              //挂载一个文件系统，需要先创建一个目录，然后将这个文件系统挂载到这个目录上
  dev/sdb1 /u01 ext2 defaults 0 2   //添加到fstab中进行自动挂载，这样任何时候系统重启的时候，文件系统都会被加载 
```

#### 29、unname

```
  说明：uname可以显示一些重要的系统信息，例如内核名称、主机名、内核版本号、处理器类型之类的信息 
  uname -a
```

## 30、yum

```
  说明：安装插件命令
  yum install httpd      //使用yum安装apache 
  yum update httpd       //更新apache 
  yum remove httpd       //卸载/删除apache 
```

#### 31、rpm

```
  说明：插件安装命令
  rpm -ivh httpd-2.2.3-22.0.1.el5.i386.rpm      //使用rpm文件安装apache 
  rpm -uvh httpd-2.2.3-22.0.1.el5.i386.rpm      //使用rpm更新apache 
  rpm -ev httpd                                 //卸载/删除apache 
```

#### 32、date

```
  date -s "01/31/2010 23:59:53"   ///设置系统时间
```

#### 33、wget

```
  说明：使用wget从网上下载软件、音乐、视频 
  示例：wget http://prdownloads.sourceforge.net/sourceforge/nagios/nagios-3.2.1.tar.gz
  //下载文件并以指定的文件名保存文件
  wget -O nagios.tar.gz http://prdownloads.sourceforge.net/sourceforge/nagios/nagios-3.2.1.tar.gz
```

#### 34、fdp

```
   ftp IP/hostname    //访问ftp服务器
   mls *.html -       //显示远程主机上文件列表
```

#### 35、scp

```
	scp /opt/data.txt  192.168.1.101:/opt/    
	//将本地opt目录下的data文件发送到192.168.1.101服务器的opt目录下
```

# 系统管理

#### 36、防火墙操作

```
  service iptables status      //查看iptables服务的状态
  service iptables start       //开启iptables服务
  service iptables stop        //停止iptables服务
  service iptables restart     //重启iptables服务
  chkconfig iptables off       //关闭iptables服务的开机自启动
  chkconfig iptables on        //开启iptables服务的开机自启动
  ##centos7 防火墙操作
  systemctl status firewalld.service     //查看防火墙状态
  systemctl stop firewalld.service       //关闭运行的防火墙
  systemctl disable firewalld.service    //永久禁止防火墙服务
```

#### 37、修改主机名

```
  hostnamectl set-hostname 主机名
```

#### 38、查看网络

```
ifconfig
```

#### 39、修改IP地址

```
  修改网络配置文件，文件地址：/etc/sysconfig/network-scripts/ifcfg-eth0
  ------------------------------------------------
  主要修改以下配置：  
  TYPE=Ethernet               //网络类型
  BOOTPROTO=static            //静态IP
  DEVICE=ens00                //网卡名
  IPADDR=192.168.1.100        //设置的IP
  NETMASK=255.255.255.0       //子网掩码
  GATEWAY=192.168.1.1         //网关
  DNS1=192.168.1.1            //DNS
  DNS2=8.8.8.8                //备用DNS
  ONBOOT=yes                  //系统启动时启动此设置
  -------------------------------------------------
  修改保存以后使用命令重启网卡：service network restart
```

#### 40、配置映射

```
  修改文件： vi /etc/hosts
  在文件最后添加映射地址，示例如下：
   192.168.1.101  node1
   192.168.1.102  node2
   192.168.1.103  node3
  配置好以后保存退出，输入命令：ping node1 ，可见实际 ping 的是 192.168.1.101。
```

#### 41、查看进程

```
  ps -ef         //查看所有正在运行的进程
  ps aux | grep consul	//快速查找特定进程
```

#### 42、结束进程

```
  kill pid       //杀死该pid的进程
  kill -9 pid    //强制杀死该进程   
```

#### 43、查看连接

```
  ping IP        //查看与此IP地址的连接情况
  netstat -an    //查看当前系统端口
  netstat -an | grep 8080     //查看指定端口
```

#### 44、远程主机

```
  ssh IP       //远程主机，需要输入用户名和密码
```

#### 45、快速清屏

```
  ctrl+l        //清屏，往上翻可以查看历史操作
```

#### 46、进入Root

```
su root			//进入对应用户，再输入密码
```

