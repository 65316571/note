# Python常用包



## ⭐DrissionPage （自动化工具库）

### DrissionPage 是什么？

**DrissionPage** 是一个国产开源的 Python 自动化工具包，
 它的主要功能是：**融合浏览器（Selenium）操作和 HTTP 请求（Requests）操作的一套统一接口**。

它的定位就是：

> “让你用一套代码，既能像用 Selenium 控制浏览器，又能像用 Requests 抓取网页。”

换句话说，
 DrissionPage **既能模拟真实浏览器操作（含JS渲染、点击滚动等）**，
 也能**直接发送 HTTP 请求获取网页内容（更快更轻）**，而且两者可以**无缝切换**。

------

### 它能做什么？



| 功能         | 说明                                                         |
| ------------ | ------------------------------------------------------------ |
| 浏览器自动化 | 类似 Selenium，可以启动浏览器、模拟点击、填表单等。          |
| 网络请求     | 类似 Requests，可以直接发 GET/POST 请求，抓取网页数据。      |
| 快速切换模式 | 一个对象（`Page`）既可以是浏览器模式，也可以是请求模式，**支持动态切换**。 |
| 高度封装     | 封装了大量常用操作，比如：`page.ele()` 直接定位元素，`page.get()` 直接访问网页 |
| 简单易用     | API 设计偏简洁友好，比原生 Selenium、Requests 更少代码。     |

------

### 为什么要用 DrissionPage？

因为在做网页自动化或者爬虫的时候，常常有这种情况：

- **需要渲染JS的页面** → 必须用 Selenium 浏览器
- **静态页面（不需要JS）** → 用 Requests就行，速度更快

如果你用 Selenium + Requests 原生写，会很麻烦，要维护两个对象。
 DrissionPage 就是为了**统一这两种操作模式**，用同一套语法搞定。

**比如**：

- 原生 Selenium 访问网页，要写好几行
- DrissionPage 只要 `page.get(url)`，内部帮你处理好是请求还是浏览器操作。

而且对于**复杂交互**（比如点击，等待元素出现）也有很多高级封装，代码量大大减少。

------

### 一个简单示例（感受一下风格）

```
python复制编辑from DrissionPage import DrissionPage

# 创建一个页面对象
page = DrissionPage()

# 访问一个页面
page.get('https://example.com')

# 获取页面标题
print(page.title)

# 查找一个按钮并点击
page.ele('按钮文字').click()

# 如果想切换成 requests 模式
page.change_mode('requests')
page.get('https://api.example.com/data')

print(page.text)
```

是不是感觉比原生 Selenium、Requests简洁很多？😄

------

### 安装方法

正常用 pip 安装：

```
bash


复制编辑
pip install drissionpage
```

> 注意要确保你的环境里已经有 Selenium、Requests，DrissionPage内部会用到。

**或者**直接装推荐环境：

```
bash


复制编辑
pip install drissionpage[full]
```

（会自动帮你装上 selenium、webdriver-manager、requests-html 等一堆常用库）

------

### 适合什么场景使用？

| 场景                                 | 推荐使用                       |
| ------------------------------------ | ------------------------------ |
| 爬取大量静态网页                     | 用 requests模式，速度快        |
| 爬取动态渲染网页（JS复杂）           | 用浏览器模式                   |
| 混合网页（有的要JS，有的不需要）     | DrissionPage自动切换，统一管理 |
| 编写浏览器自动化脚本（替代Selenium） | 简化代码，开发更快             |

所以尤其适合**网页爬虫 + 自动化测试 + 低代码浏览器操作**这些领域。

------

### 小结一句话

> **DrissionPage** = **Requests（爬虫）** + **Selenium（浏览器自动化）** 的强力融合版，且封装得特别好用，适合追求高效开发的人使用。

### 参考地址

- ### [官方文档](https://www.drissionpage.cn/get_start/installation)



## ⭐matplotlib（可视化绘图库）

### 什么是 matplotlib？

**matplotlib** 是 **Python 里最经典、最常用的可视化绘图库**，
 主要作用是：**绘制各种2D图表（柱状图、折线图、散点图、饼图、直方图等等）**，
 可以让你非常方便地把数据绘制成图形，直观展示出来。

------

### 为什么叫 matplotlib？

名字来源于两个部分：

- **Mat**：指 **MATLAB**，一个非常著名的科学计算和画图软件；
- **plotlib**：指 **plot**（绘图）和 library（库）。

它的设计初衷就是：
 **"让 Python 用户也能像 MATLAB 那样，快速做科学绘图。"**

所以早期的 matplotlib，**函数接口风格特别像 MATLAB**。

------

### matplotlib 能画什么？

可以画非常多种图，常见的有：

| 图表类型            | 说明               |
| ------------------- | ------------------ |
| 折线图（Line）      | 时间序列、趋势变化 |
| 柱状图（Bar）       | 分类数据对比       |
| 散点图（Scatter）   | 两变量分布关系     |
| 饼图（Pie）         | 占比分析           |
| 直方图（Histogram） | 频率分布           |
| 箱线图（Boxplot）   | 数据分布特性分析   |
| 热力图（Heatmap）   | 二维数据强度分布   |
| 等高线图（Contour） | 地形图、函数图     |

等等，可以说基本所有常规2D图它都能画，而且**自定义性非常高**。

------

### matplotlib 基本结构

其实 matplotlib 主要有两个重要层次：



| 组件                          | 作用                                 |
| ----------------------------- | ------------------------------------ |
| pyplot（`matplotlib.pyplot`） | **快速画图的接口**，类似“脚本式绘图” |
| 面向对象API（Artist）         | **更精细的图形控制**，适合复杂布局   |

一般初学者最常用的就是：

```
python复制编辑import matplotlib.pyplot as plt

plt.plot(x, y)   # 画折线
plt.bar(x, y)    # 画柱状图
plt.scatter(x, y)  # 画散点图
plt.show()       # 显示图形
```

简单高效，很适合快速出图。

但是如果需要专业排版（比如一张图多个子图、设置多个坐标轴等），就要用面向对象风格：

```
python复制编辑fig, ax = plt.subplots()
ax.plot(x, y)
ax.set_title('标题')
ax.set_xlabel('X轴')
ax.set_ylabel('Y轴')
```

面向对象方式更灵活，也更适合复杂图表。

------

### matplotlib 的特点（优点）



| 优点                                   | 说明                                   |
| -------------------------------------- | -------------------------------------- |
| 功能强大                               | 几乎能画所有你能想到的标准图形         |
| 自定义灵活                             | 颜色、线条、坐标、字体、背景，全都能调 |
| 和 numpy / pandas / seaborn 等深度集成 | 数据处理完可以直接喂给 matplotlib      |
| 输出格式丰富                           | 支持 PNG、SVG、PDF、EPS 等各种输出格式 |
| 开源免费                               | 发展时间长，社区成熟，资料丰富         |

------

### matplotlib 的不足（顺便提一下）

虽然很强，但也有一些小缺点：

- 原始 API 有些偏底层，复杂图表时**代码量比较大**。
- 默认样式比较“传统”，**需要手动美化**（不过近几年有改善，比如 `seaborn` 补充了更好看的默认主题）。
- 交互性差一些，特别是和新的浏览器交互式图表（像 Plotly、Bokeh）比。

所以有些时候，大家会搭配 `seaborn` 或 `plotly` 一起使用。

------

### matplotlib 安装方法

用 pip 很简单：

```
bash


复制编辑
pip install matplotlib
```

安装之后就可以直接使用了。

如果想要可视化环境更好（比如 Jupyter Notebook 支持），一般还会一块安装：

```
bash


复制编辑
pip install jupyterlab
```

这样可以在 Jupyter 里直接画图，体验更好。

------

###  一个最简单的例子（小演示）

```
python复制编辑import matplotlib.pyplot as plt

# 数据
x = [1, 2, 3, 4, 5]
y = [2, 4, 6, 8, 10]

# 绘图
plt.plot(x, y, marker='o')
plt.title('简单折线图示例')
plt.xlabel('X轴')
plt.ylabel('Y轴')
plt.grid(True)

# 显示
plt.show()
```

运行后就弹出一张标准的折线图了，非常适合快速查看数据趋势。

------

### 最后总结一句话

> **matplotlib** 是 Python 最经典的**2D绘图库**，功能全面，灵活强大，是科学计算、数据分析、工程可视化领域的“基础必学库”。



## ⭐pandas（ 数据处理和数据分析库）

### 什么是 pandas？

**pandas** 是 Python 里最重要的**数据处理和数据分析库**之一，
 它的核心作用是：

> **用表格的方式（像Excel一样）处理数据。**

它主要提供了两个核心数据结构：



| 名称        | 类比                     | 用途         |
| ----------- | ------------------------ | ------------ |
| `Series`    | 一列数据（带索引的数组） | 处理一维数据 |
| `DataFrame` | 一个完整表格（带行和列） | 处理二维数据 |

所以，**你可以把 pandas 理解成 "Python版的 Excel"**，
 它让处理数据像写表格公式一样简单，但效率又比 Excel 高很多。

------

### 为什么叫 pandas？

- 名字来源于：**Panel Data**（面板数据，经济学里的一个概念）
- **开发者 Wes McKinney** 最早在 2008年发起这个项目，希望用 Python 高效处理金融、统计数据。

所以 pandas 最初定位就是**面向数据科学、金融工程、统计建模**的。

------

### pandas 可以做什么？

| 主要功能     | 说明                                                       |
| ------------ | ---------------------------------------------------------- |
| 数据读取     | 支持 CSV、Excel、SQL、JSON 等格式快速读写                  |
| 数据清洗     | 缺失值处理、去重、格式统一、字符串处理                     |
| 数据筛选     | 按行/列条件筛选、逻辑查询                                  |
| 数据转换     | 分组（GroupBy）、透视表（Pivot Table）、合并（Merge/Join） |
| 数据统计     | 均值、中位数、标准差、计数、分组聚合统计                   |
| 时间序列分析 | 时间索引、滑动窗口、重采样（Resample）                     |
| 可视化       | 内置简易绘图接口，快速画出趋势图、分布图                   |

一句话总结：
 **任何数据从“脏乱无序”，到“干净有条理”，都可以用 pandas 处理。**

------

### pandas 常见使用场景

| 场景           | 举例                                |
| -------------- | ----------------------------------- |
| 财务报表处理   | 读Excel、按季度/部门分组统计        |
| 大数据清洗     | 对百万行 CSV 数据做缺失值处理、筛选 |
| 数据分析       | 销售数据分析、用户活跃度分析        |
| 机器学习前处理 | 特征工程、特征筛选、数据归一化      |
| 时间序列预测   | 股票价格预测、气象数据建模          |

基本上，只要涉及“表格数据”，都离不开 pandas。

------

### pandas 如何安装？

非常简单：

```
bash


复制编辑
pip install pandas
```

如果要加速处理大数据，还可以装更快的版本（比如 pandas + pyarrow）。

------

### 一个最简单的 pandas 示例

看个 10 秒钟就能理解的小例子：

```
python复制编辑import pandas as pd

# 创建一个简单表格
data = {
    '姓名': ['张三', '李四', '王五'],
    '年龄': [23, 25, 22],
    '城市': ['北京', '上海', '广州']
}
df = pd.DataFrame(data)

# 查看数据
print(df)

# 筛选：找出年龄大于23岁的人
older = df[df['年龄'] > 23]
print(older)
```

输出：

```
复制编辑  姓名  年龄 城市
0 张三 23 北京
1 李四 25 上海
2 王五 22 广州

   姓名  年龄 城市
1 李四 25 上海
```

是不是非常直观？

------

### pandas 的设计理念（更专业角度）

- **高性能**：内部基于 Numpy 的数组计算，速度非常快。
- **易用性**：API设计直观，链式操作风格，像 SQL + Excel 融合体。
- **灵活性**：DataFrame 既能行操作，又能列操作，随意切换。
- **扩展性**：与 matplotlib、seaborn、scikit-learn、statsmodels 等库完美兼容。

------

###  pandas 小缺点（也要客观看待）



| 问题           | 说明                                                         |
| -------------- | ------------------------------------------------------------ |
| 内存占用高     | 处理极大数据时（比如亿级行），容易爆内存，需要结合 Dask 等工具。 |
| 学习曲线小陡峭 | 一开始链式操作（.loc、.iloc、groupby）多了之后，初学者容易晕。 |
| 写法容易冗长   | 对复杂清洗任务，容易出现非常长的链式代码。                   |

不过总体上来说，pandas 依然是目前**数据分析界的王者**。

------

### 最后总结一句话

> **pandas** 是 Python 世界里做 **数据处理和分析**的标准神器，
>  只要涉及到表格数据，无论是小项目还是工业级应用，pandas都是基本功。



## ⭐PIL/Pillow（图像处理库）

### 什么是 PIL？

**PIL** 全称是 **Python Imaging Library**，
 它是 **Python 里最早、最经典的图像处理库**。

它的主要作用就是：

> **在 Python 中读取、修改、保存图片。**

可以理解为：
 如果你在 Python 里想像 Photoshop 那样处理图片（旋转、裁剪、加文字、改颜色、调整大小），
 那 PIL 就是专门干这个的工具。

------

### 为什么现在大家说 Pillow？

**注意**：
 原版 PIL 其实很早（2011年左右）就停止维护了。
 后来社区为了继续支持，就诞生了一个**兼容版升级版**，叫：

> **Pillow**

所以**现在真正用的是 Pillow**，但安装和使用方式几乎跟早期 PIL 完全兼容。

**简单记忆**：

- 安装用 `pip install Pillow`
- 代码里还是 `from PIL import Image` 这样导入

所以你看到 `PIL`，其实背后是用了 `Pillow` 包。

------

### PIL / Pillow 可以做什么？

| 功能           | 说明                                          |
| -------------- | --------------------------------------------- |
| 打开和保存图片 | 支持 JPG、PNG、GIF、BMP、TIFF 等多种格式      |
| 图片缩放、裁剪 | resize、crop                                  |
| 图片旋转、翻转 | rotate、transpose                             |
| 修改像素       | getpixel、putpixel                            |
| 颜色调整       | 转换成灰度、调色、调亮度                      |
| 添加文字       | 可以在图片上画字（配合 `ImageDraw` 模块）     |
| 滤镜处理       | 支持模糊、锐化、边缘检测等滤镜（ImageFilter） |
| 合成图像       | 把多张图拼接、叠加、透明度合成                |
| 处理透明图层   | 支持RGBA通道，处理透明图片                    |

基本上，所有常规图片处理操作，它都能覆盖。

------

### PIL 的常见模块（专业视角）

| 模块           | 作用                                 |
| -------------- | ------------------------------------ |
| `Image`        | 核心模块，打开、保存、创建图片       |
| `ImageDraw`    | 在图片上画图形、文字                 |
| `ImageFont`    | 加载字体，用于绘制文字               |
| `ImageFilter`  | 应用各种图像滤镜（模糊、锐化等）     |
| `ImageEnhance` | 增强图像效果（对比度、亮度、颜色）   |
| `ImageOps`     | 常用图像操作（反色、镜像、自动裁剪） |

这些模块组合使用，可以非常强大地定制图片处理流程。

------

### 一个最简单的示例（打开一张图片并保存）

```
python复制编辑from PIL import Image

# 打开图片
img = Image.open('example.jpg')

# 查看图片尺寸
print(img.size)

# 转换成灰度图
gray_img = img.convert('L')

# 保存新图片
gray_img.save('example_gray.jpg')
```

运行后，会把彩色图转成灰度图，并保存为新文件。是不是很简洁？

------

### PIL 的特点总结

| 优点         | 说明                                            |
| ------------ | ----------------------------------------------- |
| 轻量级       | 安装体积小，运行快                              |
| 简单易用     | API直观，几行代码就能做复杂操作                 |
| 格式支持丰富 | 几乎支持所有常见图片格式                        |
| 扩展性强     | 和 numpy、opencv、matplotlib 等其他库能很好配合 |

------

### PIL/Pillow 的不足

| 问题              | 说明                                     |
| ----------------- | ---------------------------------------- |
| 速度一般          | 处理超大图片、大批量时不如 OpenCV        |
| 功能偏基础        | 没有很高级的图像识别、分割、深度学习接口 |
| 3D/矢量图支持较弱 | 更擅长处理像素级2D图像                   |

所以如果要做图像识别、图像分类这类 AI 应用，就要配合 OpenCV、TensorFlow 等更高级库一起用。

------

### 安装方法

直接安装 Pillow：

```
bash


复制编辑
pip install Pillow
```

安装好后，就可以在代码里正常：

```
python


复制编辑
from PIL import Image
```

------

### 最后总结一句话

> **PIL / Pillow** 是 Python 最经典、最简单好用的**图像处理库**，适合做图片读取、编辑、保存等基础操作，是 Python 图像处理的入门必备工具。

## ⭐Requestium（网页数据采集库）

### 什么是 Requestium？

**Requestium** 是一个第三方 Python 库，
 它的核心作用是：

> **把 requests + selenium + webdriver 组合在一起，统一操作网页数据采集。**

简单来说，就是：

- 它继承了 **requests** 的易用性（发 HTTP 请求拿数据很方便）
- 又集成了 **Selenium** 的强大（可以操控浏览器，执行 JavaScript）
- 并且可以在两者之间**无缝切换**（比如先用 requests 访问静态页面，遇到复杂页面一键切到 selenium 浏览器去执行）

所以你可以理解为：

> **Requestium = requests + selenium + 浏览器驱动（如 ChromeDriver） + 更好用的封装**

它主要服务于**网页爬虫、数据抓取、网页自动化测试**这些场景。

------

### 为什么需要 Requestium？

因为在实际开发中，网页分两种：

| 网页类型           | 处理方法                                           |
| ------------------ | -------------------------------------------------- |
| 静态页面           | 直接 requests 请求 HTML 就能拿到数据               |
| 动态页面（JS渲染） | 需要 Selenium 启动浏览器，等待 JS 渲染完才能拿数据 |

而现实中经常遇到：

- 有些接口可以直接 requests 抓；
- 有些需要模拟登录、动态加载；
- 有些需要 cookie/session 保持同步。

如果你自己用 requests、selenium 各管一块，要手动处理 Cookie，同步 session，非常麻烦。

Requestium 帮你**统一了请求环境**，让代码更干净，流程更顺滑。

------

### Requestium 的主要特点

| 特点                          | 说明                                          |
| ----------------------------- | --------------------------------------------- |
| 兼容 requests                 | 可以像正常用 requests 那样写 `.get() .post()` |
| 内置 selenium                 | 自动帮你管理 webdriver（Chrome/Firefox）      |
| Cookie 自动同步               | requests 和 selenium 自动共享 cookie/session  |
| 轻量封装                      | 不额外引入很多新概念，基本基于 requests 风格  |
| 支持代理、验证、headers自定义 | 方便突破反爬虫机制                            |

总之就是，让爬虫工程师**又快又优雅地**切换静态爬取和动态爬取。

------

### 直接通过 pip 安装：

```
bash


复制编辑
pip install requestium
```

⚡ 注意：
 因为 requestium 需要 selenium，所以你还得提前装好 selenium 和 chromedriver 或 geckodriver。

------

### 一个典型的使用示例（超级简单清晰）

```
python复制编辑from requestium import Session

# 创建一个 Session
s = Session(
    browser='chrome',            # 用 Chrome 浏览器
    browser_options=['--headless'],  # 无界面模式
    webdriver_path='./chromedriver', # 指定本地 chromedriver 路径
)

# 1. 先用 requests 方式访问简单页面
r = s.get('https://example.com')
print(r.status_code)
print(r.text)

# 2. 遇到需要动态渲染的页面，直接切换成 selenium
s.transfer_session_cookies_to_browser()
s.driver.get('https://example.com/some_js_heavy_page')

# selenium 操作
s.driver.find_element('id', 'login-button').click()

# 操作后再切回 requests
s.transfer_browser_cookies_to_session()
r2 = s.get('https://example.com/after_login')
print(r2.text)
```

**核心流程：**

- `Session` 同时拥有 requests、selenium 的能力。
- `transfer_session_cookies_to_browser()` 把现有 cookies 给浏览器。
- `transfer_browser_cookies_to_session()` 反过来同步 cookies 回 requests。

是不是非常丝滑？

------

### 适合使用 Requestium 的场景

| 场景         | 说明                                         |
| ------------ | -------------------------------------------- |
| 爬虫工程     | 网站复杂、既有静态接口又有动态 JS 逻辑       |
| 自动化测试   | 测试登录流程、支付流程等需要既请求又操作网页 |
| 抢票抢购脚本 | 页面复杂、需要模拟登录、操作按钮             |
| 大数据采集   | 高效采集大量网页内容，优化切换成本           |

------

### Requestium 小缺点

| 问题          | 说明                                                   |
| ------------- | ------------------------------------------------------ |
| 维护频率一般  | 不是大公司背景，社区活跃度一般                         |
| 依赖 selenium | 需要本地有 chromedriver、geckodriver，管理起来稍微麻烦 |
| 高并发能力弱  | 单机大量高并发爬取还是要配合异步框架比如 aiohttp 之类  |

如果你想搞超大规模爬虫，还是得自定义优化。

------

### 最后总结一句话

> **Requestium** 是一个把 requests 和 selenium 组合在一起、让网页抓取更顺滑、更简单的神器，适合复杂网页的采集工程。

## ⭐requests（发送 HTTP 请求库）

##  什么是 requests？

**requests** 是 Python 中最广泛使用的、用于**发送 HTTP 请求**的第三方库。
 它的核心功能就是：

> **让你用非常简单的方式，在 Python 中发 HTTP/HTTPS 请求，获取网页或API的数据。**

如果你想用 Python 模拟浏览器访问网页、提交表单、发送 API 请求、下载文件 —— requests 就是最标准、最推荐用的工具。

**一句话总结**：

> requests 就是 Python 里的**超好用的 HTTP 客户端库**。

------

## 为什么需要 requests？

在早期，Python 标准库自带了 `urllib`，虽然也能发 HTTP 请求，但非常难用，代码又长又丑。

而 requests 出现后，简化了 90% 的繁琐操作，设计理念就是：

> **让 HTTP 请求像操作普通 Python 对象一样简单自然。**

官方口号是：

> "**HTTP for Humans**"（为人类设计的 HTTP 库）

所以，requests 在 Python 爬虫、API开发、自动化测试等领域几乎是**标配**。

------

## requests 的主要功能

| 功能        | 说明                                                  |
| ----------- | ----------------------------------------------------- |
| 发送请求    | 支持 GET、POST、PUT、DELETE、PATCH 等常用 HTTP 方法   |
| 设置请求头  | 支持自定义 headers 模拟浏览器访问                     |
| 携带参数    | URL参数（params）、表单参数（data）、JSON参数（json） |
| 上传文件    | 支持 multipart 文件上传                               |
| 处理 Cookie | 自动管理和发送 cookies                                |
| 维持会话    | 支持 Session 对象保持登录状态                         |
| 超时控制    | 支持 timeout 限制防止卡死                             |
| 代理设置    | 支持 HTTP/HTTPS 代理配置                              |
| SSL控制     | 支持忽略 HTTPS 证书验证                               |
| 流式下载    | 适合大文件下载（如视频、图片）                        |
| 响应处理    | 自动解析响应内容（text、content、json）               |

总之，所有你能想到的 HTTP 操作，requests 都能做，而且做得非常优雅。

------

###  安装方法

```
bash


复制编辑
pip install requests
```

安装完成后，在代码里就可以直接：

```
python


复制编辑
import requests
```

------

###  一个典型使用例子（超清晰版）

##### 简单 GET 请求

```
python复制编辑import requests

response = requests.get('https://www.example.com')
print(response.status_code)  # 200 表示成功
print(response.text)         # 返回网页的 HTML 内容
```

#####  POST 提交表单

```
python复制编辑data = {'username': 'admin', 'password': '123456'}
response = requests.post('https://www.example.com/login', data=data)
print(response.json())  # 如果返回 JSON 数据，可以直接解析
```

##### 带 Headers 模拟浏览器访问

```
python复制编辑headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)',
}
response = requests.get('https://www.example.com', headers=headers)
print(response.text)
```

#####  使用 Session 持久化（比如登录后访问）

```
python复制编辑s = requests.Session()

# 第一次登录
s.post('https://www.example.com/login', data={'user':'xxx', 'pass':'yyy'})

# 登录后访问个人中心
response = s.get('https://www.example.com/profile')
print(response.text)
```

------

### requests 的常用参数

| 参数            | 说明                     |
| --------------- | ------------------------ |
| url             | 请求的网址               |
| params          | URL 参数（GET请求）      |
| data            | 表单数据（POST请求）     |
| json            | JSON格式数据（POST请求） |
| headers         | 请求头（模拟浏览器）     |
| cookies         | 自定义 cookies           |
| files           | 上传文件                 |
| timeout         | 超时时间                 |
| proxies         | 设置代理服务器           |
| verify          | 是否验证SSL证书          |
| allow_redirects | 是否允许重定向           |

------

###  requests 的优点总结

| 优点     | 说明                                  |
| -------- | ------------------------------------- |
| 简洁优雅 | 设计自然，符合 Pythonic 风格          |
| 易学易用 | 入门门槛极低，文档超清晰              |
| 功能全面 | 几乎覆盖了所有 HTTP 应用场景          |
| 稳定可靠 | 社区活跃，Bug少，更新频繁             |
| 兼容性好 | 支持 Python2 和 Python3，适配各种平台 |

几乎所有做 Python 爬虫、接口开发的人都会默认用它。

------

### requests 的小缺点

| 问题             | 说明                                                         |
| ---------------- | ------------------------------------------------------------ |
| 单线程           | requests 本身是同步阻塞的，不适合高并发大量请求              |
| 不是异步         | 如果要处理成千上万个请求，需要配合 aiohttp 或异步框架        |
| 不支持浏览器行为 | 无法执行 JavaScript，需要配合 selenium 或 playwright 处理动态页面 |

也就是说，requests 超好用，但如果要**异步并发爬虫**或者**复杂动态网页爬虫**，还得配合其他工具。

------

### requests 和 urllib 的对比

| 特点     | requests            | urllib               |
| -------- | ------------------- | -------------------- |
| 简洁性   | 极高                | 复杂、代码多         |
| 功能性   | 全面                | 基础功能             |
| 适用场景 | 爬虫、API开发、测试 | 小型脚本、兼容性需求 |
| 现代化   | 是                  | 否                   |

除非有特别需求，否则新项目基本都是用 requests。

## ⭐Selenium（自动化测试工具包）

### 什么是 Selenium？

**Selenium** 是一个非常流行的 Python（也支持 Java、C# 等）自动化测试工具包。
 它的主要作用是：

> **模拟人类操作真实浏览器**，自动打开网页、点击按钮、填写表单、滑动页面、截屏、执行 JavaScript 等操作。

你可以把它理解为：

- 它不是简单发请求（像 requests）
- 它是真正打开一个完整的浏览器（Chrome、Firefox、Edge...）
- **模拟真人操作网页**，而且可以完全编程控制！

------

### 为什么需要 Selenium？

因为很多现代网站是**动态渲染的**：

- 页面源代码里没有完整数据
- 必须浏览器执行 JavaScript 才能看到真正内容
- 需要模拟登录、输入验证码、下拉滚动、触发懒加载

而传统的 requests 根本无法做到这一点。

所以在这种情况下：

> 要想抓取数据，或者测试网页功能，就必须用 Selenium 来操控**真实浏览器**。

------

### Selenium 的核心能力

| 能力               | 说明                                     |
| ------------------ | ---------------------------------------- |
| 浏览器控制         | 自动打开、关闭、最大化、最小化浏览器窗口 |
| DOM操作            | 定位元素、点击、输入文字、拖拽           |
| 事件触发           | 鼠标悬停、右键、双击、键盘输入           |
| JavaScript执行     | 执行任意JS代码，拿到执行结果             |
| 等待控制           | 等待页面加载完成，或者等待特定元素出现   |
| Cookie/session管理 | 支持获取和设置浏览器中的Cookie           |
| 截屏               | 整页截图或元素截图                       |
| 多窗口/多标签管理  | 支持切换窗口、切换标签页                 |
| 文件上传/下载      | 模拟文件上传按钮，处理文件下载弹窗       |

------

### 安装方法

```
bash


复制编辑
pip install selenium
```

不过，仅安装 selenium 不够，**还需要浏览器驱动**（WebDriver），比如：



| 浏览器  | 驱动器       |
| ------- | ------------ |
| Chrome  | chromedriver |
| Firefox | geckodriver  |
| Edge    | msedgedriver |

Selenium 通过 WebDriver 与真实浏览器通讯。

通常需要下载对应版本的驱动（驱动版本必须和你的浏览器版本对应！），或者使用自动管理工具，比如：

```
bash


复制编辑
pip install webdriver-manager
```

然后代码里自动管理驱动。

------

### 一个典型使用示例（完整清晰版）

```
python复制编辑from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
import time

# 初始化浏览器（自动下载、管理driver）
driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()))

# 打开网页
driver.get('https://www.example.com')

# 查找元素
search_box = driver.find_element(By.NAME, 'q')
search_box.send_keys('Selenium 教程')

# 提交表单
search_box.submit()

# 等待页面加载
time.sleep(3)

# 截屏
driver.save_screenshot('result.png')

# 关闭浏览器
driver.quit()
```

**注意细节：**

- `find_element(By.XXX, '值')` 这种方式可以定位各种元素
- `send_keys` 是向输入框输入文字
- `submit` 是提交表单
- `save_screenshot` 保存当前屏幕

------

###  Selenium 的常见使用场景

| 场景         | 说明                                   |
| ------------ | -------------------------------------- |
| 爬虫工程     | 抓取动态渲染网页（JS生成内容）         |
| 自动化测试   | 自动化测试网站功能（比如登录流程测试） |
| UI测试       | 自动检查网页布局、元素存在性           |
| 批量数据录入 | 自动填写网页表单、自动提交             |
| 自动化操作   | 比如抢票、抢购、签到脚本               |

------

### Selenium 的优缺点

### ✅ 优点

| 优点         | 说明                                               |
| ------------ | -------------------------------------------------- |
| 功能极其强大 | 几乎可以模拟人能做的一切                           |
| 跨浏览器支持 | Chrome、Firefox、Edge、Safari 都能用               |
| 大量扩展支持 | 各种插件、远程控制（Selenium Grid）、Headless 模式 |
| 主流认可     | 各大公司广泛用于测试、爬虫、自动化脚本             |

### ❌ 缺点

| 缺点           | 说明                                                         |
| -------------- | ------------------------------------------------------------ |
| 启动慢         | 启动浏览器开销比较大                                         |
| 资源消耗高     | 比 requests/aiohttp 要占更多 CPU、内存                       |
| 并发低         | 不适合高并发（因为每个实例都要启动一个浏览器）               |
| 反爬虫容易检测 | 有的网站专门针对 Selenium 检测（比如检测 webdriver特征，需要特殊处理） |

所以如果只是抓取**简单静态页面**，用 requests 就够了；
 如果需要**复杂交互、JavaScript渲染**，才建议用 Selenium。

------

### Selenium 生态补充

- **Selenium Grid**：支持分布式部署 Selenium，远程操控多个浏览器
- **BrowserMob Proxy**：可以配合 Selenium 拦截、修改网络请求
- **undetected-chromedriver**：规避网站检测 Selenium 的特殊驱动

如果你需要应对复杂反爬虫环境，这些工具很重要。

------

###  Selenium 和其他工具对比

| 工具       | 特点                                    | 适合场景               |
| ---------- | --------------------------------------- | ---------------------- |
| requests   | 轻量、快速，适合静态网页/API            | 简单爬虫               |
| selenium   | 模拟真实浏览器，适合动态网页/交互式操作 | 动态渲染网站           |
| playwright | 新一代浏览器自动化，更快更隐蔽（推荐）  | 高级爬虫、高并发自动化 |

如果是新的项目，很多工程师现在更推荐使用 **playwright**，因为它在性能、反检测方面更强，但 selenium 依然是基础且必须掌握的。

------

### 总结一句话

> **Selenium** 是 Python 世界中最强大的浏览器自动化工具，适合需要“模拟真人操作网页”的所有场景，是爬虫工程师、测试工程师、自动化工程师的必备技能。

**PyInstaller** 是一个非常实用的 **Python 应用打包工具**，它可以把 Python 程序打包成 **独立的可执行文件（.exe、.app、Linux的二进制文件）**，使得即使目标机器上没有安装 Python 环境，也可以直接运行你的程序。

------

## ⭐PyInstaller （打包成可执行程序包）

> **一句话概括**：
>  将 Python 脚本和它依赖的所有模块、库、资源文件一起打包，生成一个独立的可执行程序，**无需安装 Python 环境即可运行**。

------

###  PyInstaller 的主要特性

- **跨平台支持**
   支持在 Windows、macOS、Linux 上打包程序（但**打包只能在对应操作系统上进行**，比如想打 Windows 的 `.exe`，就必须在 Windows 上打）。
- **无需 Python 环境**
   打包出来的程序可以直接运行，不需要在目标机器上预装 Python 解释器或依赖库。
- **自动分析依赖**
   PyInstaller 会自动检测你的 Python 脚本需要的所有模块、动态库（.so、.dll、.dylib 等），并打包进最终的程序里。
- **支持资源文件打包**
   比如图片、配置文件、音频等，也可以一并打包进可执行程序中。
- **多种打包模式**
  - **单文件模式** (`--onefile`)：打成一个大文件，使用方便，但启动稍慢。
  - **单目录模式** (`默认`)：会生成一个包含很多文件的文件夹，启动速度快，但不够整洁。
- **支持加密和防反编译**（基本）
   可以一定程度上加密源码，比如使用 `--key` 参数，但是 PyInstaller 打包的程序本质上还是容易被逆向（因为 Python 本身是解释性语言）。

------

### PyInstaller 的基本使用方法

#### 1. 安装 PyInstaller

```bash
pip install pyinstaller
```

#### 2. 基本打包命令

```bash
pyinstaller your_script.py
```

打包完成后，会在项目目录下生成两个文件夹：

- `build/`：临时构建文件。
- `dist/`：最终生成的可执行文件就在这里。

#### 3. 打包成单个可执行文件

```bash
pyinstaller --onefile your_script.py
```

生成的 `.exe` 文件会包含所有内容，只是第一次运行时启动慢一些，因为它要解压临时文件到内存。

#### 4. 打包带图标的程序（Windows下）

```bash
pyinstaller --onefile --icon=your_icon.ico your_script.py
```

#### 5.打包GUI程序（去掉命令行黑窗口）

如果是 PyQt、Tkinter 这类图形界面程序，可以加上 `--noconsole`：

```bash
pyinstaller --onefile --noconsole your_script.py
```

否则即使是图形界面程序，也会弹出一个黑色命令行窗口。

------

### PyInstaller 的常见问题

| 问题                             | 原因                                 | 解决方法                                    |
| -------------------------------- | ------------------------------------ | ------------------------------------------- |
| 打包后程序很大                   | 打包了完整 Python 解释器和所有依赖库 | 可以考虑用 UPX 压缩，但压缩效果有限         |
| 打包后程序运行出错（找不到模块） | PyInstaller 误判漏掉了依赖           | 用 `--hidden-import` 手动指定需要包含的模块 |
| 打包后启动很慢                   | 尤其是单文件模式，需要解压到临时目录 | 这是正常现象，可以用目录模式打包来提速      |
| 防止被反编译困难                 | Python解释性语言难以完全保护         | 可用 PyArmor、Cython 做代码加密或混淆处理   |

------

###  PyInstaller 的适用场景

- 发布桌面应用（比如 PyQt、Tkinter 开发的桌面软件）
- 把工具脚本打包成 `.exe` 供非技术用户使用
- 内网环境、受限环境下发布 Python 程序
- 移交测试/演示版程序给客户使用

------

###  一个简单的打包流程示例

假设你有一个文件 `app.py`，内容如下：

```python
import time

print("欢迎使用我的程序")
time.sleep(5)
```

你打包命令：

```bash
pyinstaller --onefile --noconsole app.py
```

打包完成后，在 `dist/` 目录下就有一个独立的 `app.exe`，双击运行即可，完全不需要目标机器安装 Python 环境！

------

### ✅ 小结一句话

> **PyInstaller** 是一个让你的 Python 程序“像普通软件一样运行”的打包神器，非常适合开发者将脚本封装成可执行文件发布或交付。



**`auto-py-to-exe`** 是一个基于 **PyInstaller** 的 **图形界面封装工具**，
 简单说，就是给 PyInstaller 加了个 **可视化界面（GUI）**，让你**不用敲命令行**，也能轻松把 Python 脚本打包成 `.exe` 等可执行文件。

------



# ⭐auto-py-to-exe （图形界面操作打包）

> **一句话概括**：
>  `auto-py-to-exe` 是一个「图形界面的 PyInstaller 配置生成器」，帮助你更方便地使用 PyInstaller。

它本身并不负责打包，而是帮你**生成 PyInstaller 的打包命令**，并且直接调用 PyInstaller 去执行。

------

###  auto-py-to-exe 主要特点

- **零命令行压力**：
   不用手写 `pyinstaller` 的复杂命令，一切通过按钮、选项选择。
- **一键打包**：
   直接通过界面选择源文件、图标、依赖，点一下就能打包出 `.exe` 文件。
- **高度自定义**：
   支持 PyInstaller 几乎所有参数，比如：
  - 单文件/单目录
  - 控制台模式/无控制台
  - 自定义图标
  - 添加资源文件
  - 添加额外的 Python 模块
  - 隐藏导入的模块
  - 指定输出目录
- **预览命令行参数**：
   可以看到界面上的选项对应生成了什么 `pyinstaller` 命令，便于学习 PyInstaller 的参数用法。
- **跨平台支持**：
   可以在 Windows、Linux、macOS 上运行（**但打包原则上只能打成本机平台的程序**）。

------

### auto-py-to-exe 的安装方法

安装前建议确保 Python 已经装好，并且 pip 是最新版本。

```
bash


复制编辑
pip install auto-py-to-exe
```

安装完成后，直接启动：

```
bash


复制编辑
auto-py-to-exe
```

会自动弹出一个漂亮的打包界面！

------

### auto-py-to-exe 使用流程

#### 1. 选择主脚本

在界面最上方，选择你要打包的 Python 脚本，比如 `my_script.py`。

#### 2. 配置基本选项

- **打包模式**：
  - 一个文件（--onefile）
  - 一个文件夹（默认）
- **窗口模式**：
  - 控制台程序（黑窗口）
  - 窗口程序（无黑窗口） → 适用于 Tkinter、PyQt、pygame 应用
- **图标**：
  - 可以选择 `.ico` 格式的图标文件自定义你的程序图标。

#### 3. 添加额外文件（如资源文件）

比如如果你的程序需要加载图片、音频、配置文件，可以在 "Additional Files" 栏添加。

#### 4. 高级选项（可选）

- 隐藏导入模块
- 自定义临时路径
- 添加命令行参数
- 加密（PyInstaller 支持的弱加密）
- 指定 PyInstaller 路径

#### 5. 点击「转换 .py 到 .exe」

程序会调用 PyInstaller，完成打包过程。打包成功后，可以直接在指定的目录中找到生成的 `.exe`。

------

###  auto-py-to-exe 示例界面大概是这样

（示意，不是真正的界面）

```
less复制编辑-------------------------------------------------
| [选择你的 .py 文件] [浏览]                       |
|                                                 |
| [单文件模式] ( ) 是  ( ) 否                      |
| [窗口程序]  ( ) 是  ( ) 否（默认带黑窗）          |
| [添加图标] [浏览 .ico 文件]                      |
|                                                 |
| [附加资源] [添加图片、配置文件等]                |
|                                                 |
| [生成 PyInstaller 命令预览]                     |
|                                                 |
| [开始打包] [预览命令]                            |
-------------------------------------------------
```

非常直观，特别适合对命令行不熟悉的开发者，或者想要快速打包出干净 `.exe` 的人。

------

### auto-py-to-exe 的优缺点总结

| 优点                                        | 缺点                                                         |
| ------------------------------------------- | ------------------------------------------------------------ |
| 可视化、简单易用，无需记复杂命令            | 本质仍依赖 PyInstaller，复杂打包问题还是要理解 PyInstaller 原理 |
| 支持所有 PyInstaller 选项                   | GUI 处理不了特别复杂、动态的打包逻辑                         |
| 预览生成的命令行，可以学到 PyInstaller 参数 | 打包体积大，启动稍慢（因为 Python 原生打包的通病）           |
| 支持跨平台                                  | 打包只能针对本机平台（Windows打包Windows，Linux打包Linux）   |

------

### ✅ 小结一句话

> **auto-py-to-exe** = **PyInstaller 的傻瓜式图形界面版**，大大降低了 Python 应用打包成 `.exe` 的门槛，非常适合初学者、中小型项目快速交付。