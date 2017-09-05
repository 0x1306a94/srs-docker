# srs-docker

自行添加下面docker镜像源

```
http://aad0405c.m.daocloud.io
```
#### Build

```shell
git clone https://github.com/king129/srs-docker.git
cd srs-docker
docker build -t name .
```

#### Run

```shell
docker run -it -p 1935:1935 name
cd srs/trunk
./objs/srs -c conf/rtmp.conf
```

#### Push

```shell
ffmpeg -re -i /Users/king/Documents/MV/AOA.mp4 -vcodec copy -acodec copy -f flv -y rtmp://127.0.0.1:1935/live/livestream
``` 

#### Play

* use VLC.app play
```shell
rtmp://127.0.0.1:1935/live/livestream
```
