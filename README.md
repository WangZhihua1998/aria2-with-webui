# 自用-为ARM开发板构建下载机环境

Pleases Fork this project and modify for yourself.

---

Aria2 with webui
---
Only about 37Mb

You can edit the config file out of the image.  


### Install
1. Download the image from release.

2. Just decompress it to a tarball(`xz -d -k aria2-with-webui.tar.xz`).

3. Load the decompressed image with `docker load -i aria2-with-webui.tar`

4. Replace **/DOWNLOAD_DIR** and **/CONFIG_DIR** with dir paths, and **YOUR_SECRET_CODE** for security. Run command below to  
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

### Build:  
(If you build the image on arm devices,just ignore 2)
1. `git clone https://github.com/WangZhihua1998/aria2-with-webui.git`
2. `docker run --rm --privileged multiarch/qemu-user-static:register --reset`
3. Go to the "aria2-with-webui" floder and execute `sudo docker build -f Dockerfile -t wangzhihua/aria2-with-webui .`  

### Link:  
https://github.com/aria2/aria2  
https://github.com/ziahamza/webui-aria2  
https://github.com/acgotaku/BaiduExporter 

https://github.com/XUJINKAI/aria2-with-webui
