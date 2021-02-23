#!/bin/sh
# 先清空默认的内容
echo "clear default source.list first"
truncate -s 0 /etc/apt/source.list
echo "clear successful"
# 填入默认镜像

echo "start fill aliyun source to source.list"

echo "deb http://mirrors.aliyun.com/debian/ stretch main non-free contrib
deb-src http://mirrors.aliyun.com/debian/ stretch main non-free contrib
deb http://mirrors.aliyun.com/debian-security stretch/updates main
deb-src http://mirrors.aliyun.com/debian-security stretch/updates main
deb http://mirrors.aliyun.com/debian/ stretch-updates main non-free contrib
deb-src http://mirrors.aliyun.com/debian/ stretch-updates main non-free contrib
deb http://mirrors.aliyun.com/debian/ stretch-backports main non-free contrib
deb-src http://mirrors.aliyun.com/debian/ stretch-backports main non-free contrib
" >> /etc/apt/source.list

echo "fill successful"