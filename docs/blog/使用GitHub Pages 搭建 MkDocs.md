## 使用GitHub Pages 搭建 MkDocs

### 感谢：[Yang-Xijie](https://github.com/Yang-Xijie/yang-xijie.github.io)

#### 使用Docker创建网站文件：

使用docker可以避免繁琐的环境配置以及各种各样的报错

此次以Linux为例：

```
docker run --rm -it -v ${PWD}:/docs squidfunk/mkdocs-material new .
```

会在当前目录生成以下结构：

```
.
├─ docs/
│  └─ index.md
└─ mkdocs.yml
```

#### 配置GitHub Action：
在当面目录新建以下目录及文件

```
.github/workflows/ci.yml
```

写入内容：

```
name: publish site
on: # 在什么时候触发工作流
  push: # 在从本地main分支被push到GitHub仓库时
    branches:
      - master 
      - main
  pull_request: # 在main分支合并别人提的pr时
    branches:
      - main
jobs: # 工作流的具体内容
  deploy:
    runs-on: ubuntu-latest # 创建一个新的云端虚拟机 使用最新Ubuntu系统
    steps:
      - uses: actions/checkout@v2 # 先checkout到main分支
      - uses: actions/setup-python@v2 # 再安装Python3和相关环境
        with:
          python-version: 3.x
      - run: pip install mkdocs-material # 使用pip包管理工具安装mkdocs-material
      - run: mkdocs gh-deploy --force # 使用mkdocs-material部署gh-pages分支
```

新建GitHub仓库 

仓库名称：username/.github.io

上传整个目录到GitHub

在settings/pages页面设置

![image-20220719233119833](assets/image-20220719233119833.png)

