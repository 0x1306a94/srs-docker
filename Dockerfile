FROM ubuntu:14.04
MAINTAINER king <king129@vip.163.com>

WORKDIR /root
ADD ./srs.zip /root

RUN apt-get update \
    && apt-get install -y git python2.7 && python2.7 --version \
    && apt-get install -y --force-yes --no-install-recommends libpcre3 zlib1g \
    && apt-get install -y --force-yes --no-install-recommends automake autoconf libtool build-essential wget ca-certificates unzip libpcre3-dev zlib1g-dev

WORKDIR /root
RUN unzip /root/srs.zip \
    && cd /root/srs/trunk \
    && ./configure --disable-all --with-ssl --with-nginx --with-hls --with-http-callback --with-http-server --with-http-api --with-ffmpeg --with-transcode --with-librtmp --with-dvr \
    && make -j16

EXPOSE 1935

WORKDIR /root
CMD cd /root/srs/trunk && ./objs/srs -c conf/srs.conf