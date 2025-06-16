## ✅ 一、数据类型差异

|功能|MySQL|Oracle|说明|
|---|---|---|---|
|整数类型|`INT`, `TINYINT`, `BIGINT`|`NUMBER`|Oracle 统一使用 `NUMBER`，可指定精度|
|浮点数|`FLOAT`, `DOUBLE`|`FLOAT`, `NUMBER(p,s)`|Oracle 推荐 `NUMBER(p,s)`|
|字符串|`VARCHAR(n)`|`VARCHAR2(n)`|Oracle 使用 `VARCHAR2`，推荐避免用 `VARCHAR`（保留字）|
|文本类型|`TEXT`, `MEDIUMTEXT`|`CLOB`|大字段类型命名不同|
|日期时间|`DATETIME`, `TIMESTAMP`|`DATE`, `TIMESTAMP`|Oracle 的 `DATE` 包含时间，MySQL 的 `DATE` 不包含时间|

**示例对比：**

``` sql
-- MySQL name VARCHAR(100)  -- Oracle name VARCHAR2(100)
```


---

## ✅ 二、自增主键写法（AUTO_INCREMENT）

| MySQL 写法                            | Oracle 写法                                          |
| ----------------------------------- | -------------------------------------------------- |
| `id INT AUTO_INCREMENT PRIMARY KEY` | `id NUMBER PRIMARY KEY` + 序列 + 触发器（或使用 `IDENTITY`） |

**Oracle 12c+ 新写法（推荐）：**
``` sql
id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
``` 

**MySQL 写法：**
``` sql
id INT AUTO_INCREMENT PRIMARY KEY
``` 
---

## ✅ 三、默认值差异（尤其是函数）

|MySQL|Oracle|
|---|---|
|`created_at DATETIME DEFAULT NOW()`|`created_at DATE DEFAULT SYSDATE`|
|可用函数较多|默认值中不支持复杂函数或子查询|

---

## ✅ 四、布尔类型差异

|MySQL|Oracle|
|---|---|
|`BOOLEAN`（本质是 `TINYINT(1)`）|没有布尔类型（推荐用 `NUMBER(1)` 或 `CHAR(1)`）|

Oracle 中布尔逻辑常用 `0/1` 或 `'Y'/'N'` 表示。

---

## ✅ 五、字符集与排序规则

MySQL 中建表可以直接指定字符集：

``` sql
CREATE TABLE t (   ... ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
```
Oracle 的字符集通常是数据库级或表空间级定义，建表时不写字符集。

---

## ✅ 六、表空间支持

|MySQL|Oracle|
|---|---|
|通常忽略，不写|建表时可以指定表空间 `TABLESPACE userspace`|

Oracle 示例：

``` sql
CREATE TABLE emp (   ... ) TABLESPACE userspace;
``` 
---

## ✅ 七、分区表支持

两者都支持分区表，但语法完全不同，Oracle 的分区表功能更强大（范围、列表、复合等）。

---

## ✅ 八、建表完整示例对比

### ✅ MySQL 示例：

``` sql
CREATE TABLE employee (     id INT AUTO_INCREMENT PRIMARY KEY,     name VARCHAR(100),     department VARCHAR(50),     hire_date DATETIME DEFAULT NOW() ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

### ✅ Oracle 示例：

``` sql
CREATE TABLE employee (     id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,     name VARCHAR2(100),     department VARCHAR2(50),     hire_date DATE DEFAULT SYSDATE ) TABLESPACE userspace;
```

---

## ✅ 总结对比表

|功能|MySQL|Oracle|
|---|---|---|
|自增主键|`AUTO_INCREMENT`|`IDENTITY` 或序列+触发器|
|字符串类型|`VARCHAR`|`VARCHAR2`|
|默认日期函数|`NOW()`|`SYSDATE`|
|布尔值|`BOOLEAN`（其实是INT）|`NUMBER(1)`或`CHAR(1)`|
|表空间|不常用|常用，支持 `TABLESPACE` 指定|
|分区支持|有（较弱）|强大（支持多种复杂策略）|
|文本大字段类型|`TEXT`、`LONGTEXT`|`CLOB`|
|时间类型|`DATETIME`, `TIMESTAMP`|`DATE`, `TIMESTAMP`|

---

## ✅ 实践建议

- 如果你要将 MySQL 的建表语句迁移到 Oracle，一定要**手动调整数据类型**，**显式处理自增逻辑**，并根据实际业务设定表空间和默认值。
    
- 推荐使用 Oracle 12c+ 的新特性，如 `IDENTITY` 字段，以简化主键处理。