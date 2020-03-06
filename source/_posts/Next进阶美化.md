---
categories:
- 博客相关
tags:
- Hexo
- Next
- 前端
- CSS
---

## 前言

之前换了`Next`主题后又改了一些[简单的设置](/2020/03/05/Hexo更换Next主题/)，不过对有一些样式还是不满意，但是官方的`_config.yml`文件并没有提供这些选项，只能通过修改`CSS`的方式来改了。先是去网上搜了一些教程，因为版本原因很多教程都失效了，还得靠自己摸索。

> 不同版本文件路径或者具体属性都不完全一样，本文基于[NexT 7.7.2](https://pisces.theme-next.org/next-7-7-2-released/)，食用本文需要一点点点CSS基础:D。


<!-- more -->


## Next进阶美化





### 添加背景图片

先将大小合适的图片放到`./source/image/`目录中。

打开`./themes/next/source/css/_common/scaffolding/base.styl`，找到`body`，增加以下代码：

```css
background: url("/images/bg.png") fixed;  //自己更改图片url
background-position: 0 -100px;  //微调背景图片位置
```




### 鼠标点击爱心

下载以下`js`文件放到`./themes/next/source/js/`目录中。

```
https://raw.githubusercontent.com/lchkid/lchkid.github.io/master/js/clickLove.js
```

打开`./themes/next/layout/_layout.swig`，在末尾`</html>`前增加以下代码：

```html
<!-- click love -->
<script src="/js/clickLove.js"></script>
```




### 动态背景Canvas-nest

在`./source/`新建一个`_data`目录，新建`footer.swig`文件，输入以下代码：

```js
<script color="0,0,255" opacity="0.5" zIndex="-1" count="99" src="https://cdn.jsdelivr.net/npm/canvas-nest.js@1/dist/canvas-nest.js"></script>
```

打开主题配置文件`_config.yml`，找到`custom_file_path`，去掉行首#使以下代码生效：

```yaml
footer: source/_data/footer.swig
```




### 设置透明度 

打开`./themes/next/source/css/_schemes/Pisces/_layout.styl`，找到`.header-inner`和`.content-wrap`，

打开`./themes/next/source/css/_schemes/Pisces/_sidebar.styl` ，找到`.sidebar`，增加以下代码：

```css
opacity: .8;
```




### 修改code样式

打开`./themes/next/source/css/_common/scaffolding/highlight/highlight.styl`，找到`code`，修改以下代码：

```css
background: #颜色;
border-radius: 2px;
color: #颜色;
padding: 1px 2px;
word-wrap();
```




### 修改超链接样式

打开`./themes/next/source/css/_common/scaffolding/base.styl`，找到`a, span.exturl`和`&:hover`，修改以下代码：

```css
border-bottom: 1px solid #颜色;
color: #颜色;

border-bottom-color: #颜色;
color: #颜色;
```




### 修改阅读全文按钮样式

打开`./themes/next/source/css/_common/scaffolding/buttons.styl`，找到`.btn`和`&:hover`，修改以下代码：

```css
background: #颜色;
border: 2px solid #颜色;
border-radius: 圆角;
color: #颜色;
display: inline-block;
font-size: 字体大小;
line-height: 2;
padding: 0 20px;
text-decoration: none;
transition-property: background-color;
the-transition();

background: #颜色;
border-color: #颜色;
color: #颜色;
```




### 修改底部文字样式

打开`./themes/next/source/css/_common/outline/footer/footer.styl`，找到.footer，修改以下代码：

```css
color: #颜色;
opacity: .8;
border: none;
```




### 合并某些样式

如果觉得上述方法改起来麻烦，可以将他们合并在一个文件中。

打开`./themes/next/source/css/_common/components/post/post.styl`，在最下方直接新增`CSS`代码：

```css
// code样式
code {
  background: #fffcd7;
  color: #ff6060;
  padding: 1px 2px;
}

// 超链接样式
.post-body p a {
  color: #6097ff;
  border-bottom: none;
  border-bottom: 1px solid #6097ff;
  &:hover {
    color: #ff6060;
    border-bottom: none;
    border-bottom: 1px solid #ff6060;
  }
}


// 阅读全文样式
.btn {
  color: #ff6060;
  background-color: #fff;
  display: inline-block;
  font-weight: 400;
  text-align: center;
  vertical-align: middle;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  border: 1px solid #ff6060;
  padding: 0.375rem 0.75rem;
  font-size: 1rem;
  line-height: 1.5;
  border-radius: 0.25rem;
  transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;

  &:hover {
    color: #fff;
    background-color: #ff6060;
    border-color: #ff6060;
  }
}

// 底部文字样式
.footer, .footer a {
  color: #ffffff;
  opacity: .8;
  border: none;
  
  &:hover {
    border: none;
  }
}

// and so on...
```





## 参考资料
>http://blackchy.com/2019/09/30/2019-09-30-Hexo-Next-Link-Color/
>[http://watchmen.xin/2018/06/23/个人知识体系/个人博客/Hexo/修改主题超链接样式/](http://watchmen.xin/2018/06/23/个人知识体系/个人博客/Hexo/修改主题超链接样式/)







