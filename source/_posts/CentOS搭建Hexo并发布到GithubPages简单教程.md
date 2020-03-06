---
categories:
- 博客相关
tags:
- Linux
- Hexo
- Next
---

## 前言

前几年闲着没事在`GitHub Pages`搭了一个`Hexo`，一直没怎么用，一些记录和心得什么的都放在CSDN上了，这回趁着时间多把`Hexo`重新拾起来，就从搭建开始重新写起吧。


<!-- more -->


## 搭建环境

> `Hexo`是一个快速、简洁且高效的博客框架。`Hexo`使用`Markdown`（或其他渲染引擎）解析文章，在几秒内，即可利用靓丽的主题生成静态网页。

首先要找一个环境来搭`Hexo`，可以用本机、虚拟机或者云主机，我这次用的是AWS，所以以下的操作都是基于Linux的。我们都知道`Hexo`是基于`node.js`的，而且要在`GitHub Pages`上发布就肯定少不了`git`，所以准备工作就很明显了：

1. 安装`git`：

   ```shell
   $ yum install -y git-core
   ```

2. 安装`node.js：`

   ```shell
   $ curl -sL https://rpm.nodesource.com/setup_13.x | bash -
   $ yum install -y nodejs
   ```
   
3. 检查一下装成功没有：

   ```shell
   $ git --version && node -v
   ```

这样我们的准备工作就完成了。





## 配置`git`

1. 配置`git`全局信息：

   ```shell
   $ git config --global user.name "GitHub用户名"
   $ git config --global user.email "GitHub邮箱地址"
   ```

2.  创建`ssh`秘钥：

   ```shell
   $ mkdir ~/.ssh
   $ ssh-keygen -t rsa -C "GitHub邮箱地址"
   $ cat ~/.ssh/id_rsa.pub
   ```
   
3. 上传秘钥：

   将获取到的秘钥配置到`GitHub`网站，测试一下连接是否成功，这样`git`环境就配置完成了。

   ```shell
   $ ssh -T git@GitHub.com
   ```





## 安装`Hexo`

1. 安装`hexo`包和`hexo-deployer-git`扩展：

   ```shell
   $ npm install -g hexo-cli
   $ npm install hexo-deployer-git --save
   ```
   
2. 初始化`hexo`（最开始创建容器的时候已经预设的数据卷）：

   ```shell
   $ hexo init <folder>
   ```

3. 进入容器中的`hexo`目录：

   ```shell
   $ cd /hexo
   $ npm install
   ```





## 配置`Hexo`

1. 简单配置一下网站信息：

   ```shell
   $ vi ./_config.yml
   ```

   ```yml
   # Site
   title: 网站标题
   subtitle: '网站副标题'
   description: '描述'
   keywords: 关键字
      author: 作者
   language: 语言
   timezone: '时区'

   deploy:
   type: 'git'
   repo: GitHub仓库地址
   branch: master
   ```

2. 生成静态页面：

   ```shell
   $ hexo generate  //Hexo g
   ```

3. 本地预览：

   ```shell
   $ Hexo server  //hexo s
   ```

   如果你使用的是远程`vps`，可以克隆一个会话使用`elinks`预览：

   ```shell
   $ yum install -y elinks
   $ elinks --dump http://localhost:4000
   ```





## 发布到GitHub Pages

通过以上步骤，`Hexo`本地环境已经搭建完毕，接下来要做的就是把本地环境部署到`GitHub`上去：

```shell
$ hexo deploy  //hexo d
```

几分钟后就可以通过 `https://[github_username].github.io` 来访问博客了。

至此，我们通过`GitHub`创建了一个`Hexo`博客，后续可以再把`Hexo`美化一下。





## 补充

以下是很早前遇到过的一些小问题，也搬运过来在此简单记录：

> `npm`问题，切换为`taobaonpm`即可，具体见 http://cnodejs.org/topic/4f9904f9407edba21468f31e





## 参考资料

> Hexo官方docs https://hexo.io/zh-cn/docs
