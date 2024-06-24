# baidunetdisk-docker-arm64

|name|version|arch|
|:-|:-|:-|
|baidunetdisk|4.17|arm64|

* Run `build.sh` to build newest version.

## Run

### Use Docker Run

```
docker run \
    --name=baidunetdisk  \
    -p 5800:5800  \
    -p 5900:5900  \
    -v <path-to-config>:/config  \
    -v <path-to-download>:/config/baidunetdiskdownload  \
    --restart unless-stopped  \
    anzupop/baidunetdisk:latest
```

### Use Docker Compose

```
version: "2.1"
services:
  baidunetdisk:
    image: anzupop/baidunetdisk:latest
    container_name: baidunetdisk
    environment:
      - USER_ID=1000
      - GROUP_ID=1000
    volumes:
      - ./config:/config
      - ./downloads:/config/baidunetdiskdownload
    ports:
      - 5900:5900
      - 5800:5800
    restart: unless-stopped
```

### Config

|param|details|
|:-|:-|
| `--name=baidunetdisk` |name|
| `-p 5800:5800` |Web port,[ip:5800](ip:5800)|
| `-p 5900:5900` |VNC port,[ip:5900](ip:5900)|
| `-v <config path>:/config` |baidunetdisk config path|
| `-v <download path>:/config/baidunetdiskdownload` |baidunetdisk download path|
| `-e VNC_PASSWORD=<pw>` |VNC password|
| `-e USER_ID=1000` |uid,default 1000|
| `-e GROUP_ID=1000` |gid,default 1000|
| `-e DISPLAY_WIDTH=1280` |display width,default 1280|
| `-e DISPLAY_HEIGHT=720` |display height,default 720| 

## Special Thanks

[https://hub.docker.com/r/eecs388/baseimage-gui](https://hub.docker.com/r/eecs388/baseimage-gui)
[baidunetdisk-docker](https://github.com/thomaslty/baidunetdisk-docker)
