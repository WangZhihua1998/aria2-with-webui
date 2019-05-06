# 自用-为ARM开发板构建下载机环境

Pleases Fork this project and modify for yourself.

---

Aria2 with webui
---
Only 29Mb.  
Edit config file out of the image.  
Move file completed to another folder.  
(Tasks that contains more than one files will not be moved.)  

### Install
I. replace **/DOWNLOAD_DIR** and **/CONFIG_DIR** for save data, and **YOUR_SECRET_CODE** for security. Run command below  
```
sudo docker run -d \
--name aria2-with-webui \
-p 6800:6800 \
-p 6880:80 \
-p 6888:8080 \
-v /DOWNLOAD_DIR:/data \
-v /CONFIG_DIR:/conf \
-e SECRET=YOUR_SECRET_CODE \
xujinkai/aria2-with-webui
```
  
II. Open `http://serverip:6880/` for aria2-webui, open `http://serverip:6888/` to browse data folder.  

### Build:  
在amd64上可以使用<a href="https://hub.docker.com/r/multiarch/qemu-user-static">multiarch/qemu-user-static</a>进行构建

`sudo docker build -f Dockerfile -t xujinkai/aria2-with-webui .`  

### Link:  
https://github.com/aria2/aria2  
https://github.com/ziahamza/webui-aria2  
https://github.com/acgotaku/BaiduExporter 
https://github.com/XUJINKAI/aria2-with-webui
