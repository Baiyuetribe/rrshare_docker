# rrshare
rrshare for docker（基于alpine+最新版人人影视客户端）

### 人人影视web下载器（rrshare for docker）

### 食用方法
```
docker run -d -p 3001:3001 -v /opt/rrdata:/opt/work/store --name rrys baiyuetribe/rrshare   #仅16MB
```
访问http://ip:3001 打开后台 解锁密码默认为123456，可在设置里面修改
参数说明：
- －ｐ　3001端口可自定义，比如想改成80端口，可以改为-p 80:3001
- －ｖ　用于宿主机挂载下载后文件目录，可通过根目录/opt/rrdata查看

配合h5ai可以实现在线播放：
```
docker run -t -p 10010:80 -v /opt/rrdata:/h5ai --name h5ai ilemonrain/h5ai:full    #自带ＨＴＭＬ５视频播放
```
访问http://ip:10010 就可以看到已下载的视频文件，可在线播放。

### 关于停止、启动、删除
```
docker stop rrys h5ai    # 停止运行人人影视、h5ai播放器
docker start rrys h5ai   # 启动
docker rm rrys h5ai      # 删除容器
```
