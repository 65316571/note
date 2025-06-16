# 从 make 到 gradle，浅谈自动化构建工具

### **Gnu Make**

说起自动化构建工具，不得不提make【1】。make有着悠久的历史。1977年，斯图亚特·菲尔德曼在贝尔实验室里制作了这个软件，并将其包含在了Unix系统中。这款软件是一个工具程序（Utility software），通过读取叫做“makefile”的文件，自动化构建软件。

大多数情况下，他被用来编译代码，生成结果代码，然后把结果代码链接起来生成可执行文件或者哭文件。Make出现之后，很快的就普及开来，在众多的依赖关系检查工具中，make是应用最为广泛的一个。2003年，斯图亚特·菲尔德曼因为发明了这样一款重要的工具而接受了美国计算机协会（ACM）颁发的软件系统奖。直到现在，make仍然被用来编译很多完整的操作系统。

代码语言：javascript

复制

```javascript
CFLAGS ?= -g

all: helloworld

helloworld: helloworld.o
    # Commands start with TAB not spaces
    $(CC) $(LDFLAGS) -o $@ $^

helloworld.o: helloworld.c
    $(CC) $(CFLAGS) -c -o $@ $<

clean: FRC
    rm -f helloworld helloworld.o

# This pseudo target causes all targets that depend on FRC
# to be remade even in case a file with the name of the target exists.
# This works with any make implementation under the assumption that
# there is no file FRC in the current directory.
FRC:
```

尽管瑕不掩瑜，必须承认make在可靠性、性能和实现语言上有着许多缺陷【2】，尤其是在大项目中，make的缺点会在很大程度上被放大。

### **Apache Ant**

2000年，源于Apache Tomcat工程的ant（another neat tool）问世【3】。Ant和make类似，但是以java实现，主要用于构建java工程。Ant与make最大的不同之处就是ant使用XML来描述构建过程和依赖关系。XML作为一种语言，能够清楚的定义每个task做什么，有哪些依赖。

而且，这些信息都可以在ant script中找到。更为引人注目的是，ant可以很好的支持junit的集成，因此使用ant的开发者可以很容易的进行test-driven开发，甚至极限编程。然而，不可否认的是ant仍然有很多缺点。

例如，由于ant结构灵活，所以一般为所有的项目定义一个统一的ant框架（例如Oracle的TestLogic） 但是随着项目的复杂度和数量的增加，项目与项目之间的差异化逐渐加大，最终，即使是一个经验丰富的程序员，如果不仔细研读ant脚本，依然很难读懂ant工程的higher level结构。

![img](https://ask.qcloudimg.com/http-save/yehe-198529/emmwai2sd9.jpeg)

### **Apache Maven**

作为一款构建工具，Maven【4】发布于2004年，与ant不同，主要通过约定（convention）定义构建过程；另外，Maven的功能是通过plugin实现和扩展的；在构建过程中，Maven会自动将java类库和Maven plugin下载到本地。Maven主要解决两个方面的问题：

1. **如何构建工程**
2. **描述对外部组件和Module的依赖关系**

Maven的一些优势是相对的，例如，通过约定定义工程固然能提高可读性从而提高开发效率，但是这是建立在开发者能从Maven的角度理解工程的基础之上的，也就是说开发者必须理解Maven是如何工作的。因此一个刚刚接触Maven 的开发者很难直接从Maven工程文件中读懂在执行过程中到底发生了什么。

总之，ant更加灵活，但容易带来混乱；Maven更加规范，但是学习曲线较为陡峭。

![img](https://ask.qcloudimg.com/http-save/yehe-198529/b8gc795h8h.jpeg)

### **Gradle**

Gradle发布于2012年，是JVM生态下又一款开源的自动化构建工具（其他两款是Ant，Maven），建立在Apache Ant和Apache Maven的基础上，引入了基于Groovy的DSL（domain-specific language）代替XML，声明工程的configuration。

可伸缩性强大，性能出色。支持task之间的依赖设定；不仅可以以默认的形式引用在Maven中声明的约定，而且可以对其进行定制化；支持动态下载外部jar类库和plugin。DSL的引入，使得Gradle较之与ant和maven更加简洁清晰。

![img](https://ask.qcloudimg.com/http-save/yehe-198529/qi6n4i27iy.jpeg)