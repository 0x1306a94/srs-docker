FROM ubuntu:14.04
MAINTAINER king <king129@vip.163.com>

WORKDIR /root

RUN apt-get update \
    && apt-get install -y git python2.7 && python2.7 --version \
    && apt-get install -y --force-yes --no-install-recommends libpcre3 zlib1g \
    && apt-get install -y --force-yes --no-install-recommends automake autoconf libtool build-essential wget ca-certificates unzip libpcre3-dev zlib1g-dev

WORKDIR /root
RUN git clone https://github.com/ossrs/srs.git --progress --verbose \
    && cd /root/srs/trunk \
    && git checkout 3.0release \
    && ./configure --disable-all --with-ssl --with-nginx --with-hls --with-http-callback --with-http-server --with-http-api --with-ffmpeg --with-transcode --with-librtmp --with-dvr \
    && make -j16 \
    && export SRSPATH="/root/srs/trunk" \
    && echo $SRSPATH

EXPOSE 1935

CMD cd $SRSPATH && ./objs/srs -c conf/srs.conf