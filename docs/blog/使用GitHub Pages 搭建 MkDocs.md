## 使用GitHub Pages 搭建 MkDocs

使用Docker创建网站：

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

