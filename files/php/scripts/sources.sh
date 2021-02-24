#!/bin/sh
echo "clear default source.list first"
truncate -s 0 /etc/apt/sources.list
echo "clear successful"

echo "start fill aliyun source to source.list"

RUN echo 'deb http://mirrors.aliyun.com/debian/ stretch main non-free contrib \n\
           deb-src http://mirrors.aliyun.com/debian/ stretch main non-free contrib \n\
           deb http://mirrors.aliyun.com/debian-security stretch/updates main \n\
           deb-src http://mirrors.aliyun.com/debian-security stretch/updates main \n\
           deb http://mirrors.aliyun.com/debian/ stretch-updates main non-free contrib \n\
           deb-src http://mirrors.aliyun.com/debian/ stretch-updates main non-free contrib \n\
           deb http://mirrors.aliyun.com/debian/ stretch-backports main non-free contrib \n\
           deb-src http://mirrors.aliyun.com/debian/ stretch-backports main non-free contrib \n'\
           > /etc/apt/sources.list


echo "fill successful"