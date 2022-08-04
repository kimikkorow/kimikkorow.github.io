# 使用RaidDrive+Alist管理你的网盘

## 获取程序

前往[Alist](https://github.com/alist-org/alist/releases)官方releases按需要下载版本

使用旧版[RaiDrive](./files/RaiDrive_2020.11.30.exe)

### 配置Alist

参考[官方文档](https://alist-doc.nn.ci/docs/intro)

### 编写脚本

新建一个文件 xxxx.vbs ，后缀为.vbs，写入如下代码：

```vb
Dim ws
Set ws = CreateObject("Wscript.Shell")
ws.run "cmd /c .\alist.exe",vbhide
WScript.Sleep(10000)
ws.run """D:\Program Files\OpenBoxLab\RaiDrive\RaiDrive.exe"""
WScript.Sleep(5000)
ws.appactivate "RaiDrive"
while True
ws.sendkeys "%+{F4}"
WScript.quit
Wend
```

#### PS

其中 alist.exe 改为下载的Alist可执行程序的名称， D:\Program Files\OpenBoxLab\RaiDrive\RaiDrive.exe 改成 RaiDrive_2020.11.30.exe 安装后实际的程序位置

win+R 在运行中输入 shell:startup

在打开的目录里将 xxxx.vbs 的快捷方式放入启动目录中
