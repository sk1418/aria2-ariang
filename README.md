# Aria2-AriaNg
[![](https://images.microbadger.com/badges/version/colinwjd/aria2-ariang.svg)](https://microbadger.com/images/colinwjd/aria2-ariang "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/colinwjd/aria2-ariang.svg)](https://microbadger.com/images/colinwjd/aria2-ariang "Get your own image badge on microbadger.com")

Aria2 with Aira-Ng web UI.

## Brief Introduction
* Use Apline:latest as base image, full image only **18Mb**.
* You can edit aria2 config file out of the image.
* Use Aria-Ng as aria2 web ui, it seems much more beautiful.
* Use darkhttpd as http server, it's very small(Only 36K after complied) and easy to use.
* Use user given `UID:GID` (or default 33:33) to start arai2, so that the downloaded files are not belong to `root`
* Automatically install the latest version aria-ng

## Build
```
git clone https://github.com/sk1418/aria2-ariang.git
cd aria2-ariang
docker build -t ak0818/aria2-ariang .
```

## Install
1. Optional Volums:

  * Mount `/SESSION_FILE` to `/aria2/conf/aria2.session`
  * Mount `/DOWNLOAD_DIR` to `/aria2/downloads`
  * Mount `/CONFIG_FILE` to `/aria2/conf/aria2.conf` or it will create  `aria2.conf` file with default settings.

2. Mapping ports:

  * 6800 for aira2 service
  * 80 for Aria-Ng http service
  * 8080 for downloads directory http service

3. Set your secret code use "SECRET" variable, this will append `rpc-secret=xxx` to aira2.conf file.

Run command like below(You may need to change the ports).
```
docker run --name aria2-ariang \
-p 6800:6800 -p 6880:80 -p 6888:8080 \
-v /DOWNLOAD_DIR:/aria2/downloads \
-v /CONFIG_DIR:/aria2/conf \
-e SECRET=YOUR_SECRET_CODE ak0818/aria2-ariang
```
After finished, open http://serverip:6880/ in your browser for visiting Aria-Ng home page, open http://serverip:6888/ to browser your downloads folder.
