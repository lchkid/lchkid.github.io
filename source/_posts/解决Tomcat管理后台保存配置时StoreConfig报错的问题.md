---
categories:
- 运维相关
tags:
- Tomcat
---



​		最近在测试（玩）`Tomcat`的管理后台，不过实际好像很少有用这个改配置的。只要用的少，遇到的问题就肯定多，这不刚开始在通过`Tomcat`的`Host Manager`添加虚拟主机（`Virtual Host`）的时候就遇到问题了。


<!-- more -->


首先设置好`Name`和`App base`后点击`Add`添加`VH`：

<img src="/images/20200310/tomcat-host-manager-add.png"  />

看到提示信息：

```
OK - Host [test.tomcat.org] added
```

<img src="/images/20200310/tomcat-host-manager-added.png"  />

测试一下是否成功，由于提前修改了`/webapps2/ROOT/index.jsp`（`Home-Test`），所以可以明显看到访问该`Host`跳转到了`webapps2`目录下：

<img src="/images/20200310/tomcat-host-manager-started.png"  />

然后点击`Persist configuration`下的`All`，想将当前`VH配`置保存到`/conf/server.xml`中

> 该功能说明如下：
> Save current configuration (including virtual hosts) to server.xml and per web application context.xml files

结果就报错了：

```
FAIL - Failed to persist configuration
Please enable StoreConfig to use this feature.
```

摸索了一会找到问题所在：少了一个监听（`Listener`）。

打开`server.xml`：

```shell
$ vim conf/server.xml
```

定位到`GlobalNamingResources`之前，在最后加上一个监听：

```xml
  <Listener className="org.apache.catalina.startup.VersionLoggerListener" />
  <!-- Security listener. Documentation at /docs/config/listeners.html
  <Listener className="org.apache.catalina.security.SecurityListener" />
  -->
  <!--APR library loader. Documentation at /docs/apr.html -->
  <Listener className="org.apache.catalina.core.AprLifecycleListener" SSLEngine="on" />
  <!-- Prevent memory leaks due to use of particular java/javax APIs-->
  <Listener className="org.apache.catalina.core.JreMemoryLeakPreventionListener" />
  <Listener className="org.apache.catalina.mbeans.GlobalResourcesLifecycleListener" />
  <Listener className="org.apache.catalina.core.ThreadLocalLeakPreventionListener" />
  <!-- add StoreConfig -->
  <Listener className="org.apache.catalina.storeconfig.StoreConfigLifecycleListener"/>
```

重新启动`Tomcat`后打开`Host Manager`页面，重试`Add VH`然后保存配置文件：

```
OK - Host [test.tomcat.org] added
OK - Configuration persisted
```

搞定！

不过我记得以前看教程的时候是有这个监听的，可能是`Apache Tomcat/8.5.51`取消了？也可能是我记错了也说不定，不过解决了就好:D。