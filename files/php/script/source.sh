#!/bin/sh
# 先清空默认的内容
echo "clear default source.list first"
truncate -s 0 /etc/apt/source.list
echo "clear successful"
# 填入默认镜像

echo "full aliyun source to source.list"

