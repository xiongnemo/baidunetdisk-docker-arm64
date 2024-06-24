FROM eecs388/baseimage-gui:debian-10

ENV APP_NAME="Baidunetdisk"
ENV DISPLAY_WIDTH="1280"
ENV DISPLAY_HEIGHT="720"

RUN apt-get update  \
&& apt-get install -y wget libnss3 libxss1 desktop-file-utils libasound2 ttf-wqy-zenhei libgtk-3-0 libgbm1 libnotify4 xdg-utils libsecret-common libsecret-1-0 libayatana-appindicator3-1 libdbusmenu-glib4 libdbusmenu-gtk3-4 libappindicator3-1 apt-utils curl jq

COPY root /
COPY startapp.sh /startapp.sh

RUN curl -v 'https://pan.baidu.com/disk/cmsdata?clienttype=0&app_id=250528&web=1&t=1719218069431&adCode=1&do=client' | jq '.linux | .url_1' | sed --expression='s/amd64/arm64/g' | xargs wget \
&& dpkg -i *.deb \
&& rm *.deb \
# XDAMAGE is not working well. -noxdamage
&&  sed -i 's@usr\/bin\/x11vnc  \\@usr\/bin\/x11vnc  \\\n                    -noxdamage \\@'   /etc/services.d/x11vnc/run   \
&&  install_app_icon.sh https://github.com/thomaslty/baidunetdisk-docker/raw/master/icon/baidunetdisk.png  \
# fix window decorations
&&  sed -i 's@<decor>no<\/decor>@<decor>yes<\/decor>@g'  /etc/xdg/openbox/rc.xml  \
# fix dpkg
&&  sed -i '/messagebus/d' /var/lib/dpkg/statoverride
