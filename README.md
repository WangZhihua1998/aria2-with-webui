# 自用-为ARM开发板构建下载机环境

Pleases Fork this project and modify for yourself.

---

Aria2 with webui
---
Only about 37Mb

大小只有37兆左右，压缩后可达到15兆以内。

You can edit the config file out of the image.  

可在镜像外编辑配置文件



### Install
### 安装指南

1. Download the image from release.

下载镜像

2. Just decompress it to a tarball(`xz -d -k aria2-with-webui.tar.xz`).

解压镜像，注意只需要解压，不要把tar包拆散

3. Load the decompressed image with `docker load -i aria2-with-webui.tar`

加载镜像

4. Replace **/DOWNLOAD_DIR** and **/CONFIG_DIR** with dir paths, and **YOUR_SECRET_CODE** for security. Run command below to  

替换下载文件夹和配置文件夹，如果不指定配置文件夹，会自动使用自带的配置文件。然后创建容器

```
sudo docker run -d \
--name aria2-with-webui \
-p 6800:6800 \
-p 6880:80 \
-p 6888:8080 \
-v /DOWNLOAD_DIR:/data \
-v /CONFIG_DIR:/conf \
-e SECRET=YOUR_SECRET_CODE \
--restart=on-failure:3 \ 
wangzhihua/aria2-with-webui
```
  
5. Open `http://serverip:6880/` for aria2-webui, and `http://serverip:6888/` for data.  

用浏览器打开对应的网站就可进行管理了

### Build:  

构建

(If you build the image on arm devices,just ignore 2)

如果在ARM机器上构建，只需要1、3，否则需要步骤2

1. `git clone https://github.com/WangZhihua1998/aria2-with-webui.git`
2. `docker run --rm --privileged multiarch/qemu-user-static:register --reset`
3. Go to the "aria2-with-webui" floder and execute `sudo docker build -f Dockerfile -t wangzhihua/aria2-with-webui .`  

### Link:  
https://github.com/aria2/aria2  
https://github.com/ziahamza/webui-aria2  
https://github.com/acgotaku/BaiduExporter 

https://github.com/XUJINKAI/aria2-with-webui

### TODO
解决列举文件夹时如果文件夹有汉字会导致后面数字对不齐的现象
