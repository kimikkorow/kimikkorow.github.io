# 使用GitHub Pages 搭建 MkDocs

本页最后更新时间：2022年9月5日

## 感谢
[Yang-Xijie](https://github.com/Yang-Xijie/yang-xijie.github.io)

[mkdocs-material](https://squidfunk.github.io/mkdocs-material/)

### 使用Docker创建网站文件

- 使用docker可以避免繁琐的环境配置以及各种各样的报错

此次以Linux为例：

```bash
docker run --rm -it -v ${PWD}:/docs squidfunk/mkdocs-material new .
```

- 如果你拉取Docker Hub镜像过于缓慢，可以试试以下命令，由阿里云镜像提供服务

```bash
docker run --rm -v ./doc:/app registry.cn-hangzhou.aliyuncs.com/kimikkorow/my_imagesl_ibrary:mkdocs mkdocs new .
```

- 会在当前目录生成以下结构：

```bash
.
├─ docs/
│  └─ index.md
└─ mkdocs.yml
```

#### 配置GitHub Action

- 在当面目录新建以下目录及文件

```bash
nano .github/workflows/ci.yml
```

- 写入内容：

```yaml
name: publish site
on: # 在什么时候触发工作流
  push: # 在从本地main分支被push到GitHub仓库时
    branches: 
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

#### 使用 Github Pages

##### 新建GitHub仓库

仓库名称：{username}/{username}.github.io

##### 上传整个目录到GitHub,此处使用Git

- 初始化本地GIT仓库

```bash
git init 
```

- 设置Git签名信息

```bash
git config --global user.name "name"
git config --global user.email "email"
```

- 关联远程仓库

```bash
git remote add origin https://github.com/{username}/{username}.github.io.git
```

- 推送到远程仓库

```bash
git add .
git commit -m "提交信息"
git push -u origin main
```

#### 在 settings/pages 页面设置

![image-20220719233119833](assets/image-20220719233119833.png)

#### 本地构建源码

当你编写好新的文件后，使用以下命令构建源码

官方镜像

```bash
docker run --rm -it -v ${PWD}:/docs squidfunk/mkdocs-material build
```

我的镜像

```bash
docker run --rm -v ./doc:/app registry.cn-hangzhou.aliyuncs.com/kimikkorow/my_imagesl_ibrary:mkdocs mkdocs build
```

如果你使用 Github Action，可以跳过构建的过程，因为当你 push 到GitHub时 会自动帮你构建一个新的分支 **gh-pages**

本地部署需要将 site 目录作为网站根目录
