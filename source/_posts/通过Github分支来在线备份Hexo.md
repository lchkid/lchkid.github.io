---
categories:
- 博客相关
tags:
- GitHub
- Hexo
---

## 前言

在[更换完Hexo的主题](/2020/03/05/Hexo更换Next主题/)后，博客大致就搭建完毕了，这时我们又遇到一个问题，如果我们更换了电脑或者VPS到期了，除了拷贝整个文件夹还有什么好方法可以备份`Hexo`呢？下面我们就通过`git`的分支功能来备份试试。


<!-- more -->


## 备份步骤

1. 在`hexo`目录创建本地仓库：

   ```shell
   $ cd /hexo
   $ git init
   ```

2. 添加远程仓库并设置别名为`origin`：

   ```shell
   $ git remote add origin git@github.com:lchkid/lchkid.github.io.git
   ```

3. 新建并切换到分支`hexo`：

   ```shell
   $ git branch -b hexo
   ```

4. 查看`hexo`目录下的`.gitignore`文件，若无则新建：

   ```
   .DS_Store
   Thumbs.db
   db.json
   *.log
   node_modules/
   public/
   .deploy*/
   ```

   > 该文件会忽略目录中hexo渲染完后生成的public目录和.deploy_git也就是hexo d所push的内容。

5. 添加`hexo`目录到本地仓库：

   ```shell
   $ git add .
   $ git commit -m "Blog Initial"
   ```

6. 推送到远程仓库的`hexo`分支：

   ```shell
   $ git push -u origin hexo:hexo
   ```

   > 第一次push需要用-u关联，之后就不用-u了。

7. 检查`lchkid.github.io`仓库是否新增了`hexo`分支并包含所有自定义文件。

   ![](/images/20200305/github分支截图.png)
   
8. 以后定期`push`即可：

   ```shell
   $ hexo clean
   $ hexo g -d
   $ git add .
   $ git commit -m ""
   $ git push -u origin hexo:hexo
   ```





## 还原步骤

1. 搭建`git`、`node.js`环境配置`ssh`和`git`。

2. 安装hexo：

   ```shell
   $ npm install -g hexo-cli
   $ npm install hexo-deployer-git --save
   ```
```
   
3. 从`git`分支`clone`主目录：

   ```shell
   $ mkdir /hexo
   $ cd /hexo
   $ git clone -b hexo git@github.com:lchkid/lchkid.github.io.git
```

   > Tips：如果在github的setting中设置hexo为default，就可以直接git clone而不加-b参数了。

4. `hexo`初始化：

   ```shell
   $ npm install
   ```

5. `hexo`渲染、发布即可：

   ```shell
   $ hexo g -d
   ```





## 参考资料

>https://www.zhihu.com/question/21193762/answer/489124966
>https://quareia.github.io/blog/6efb1d64/