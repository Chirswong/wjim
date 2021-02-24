FROM nginx:1.12
LABEL maintainer="wjim"

# set timezome
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


# 设置中科大镜像源
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

# 更新镜像源
RUN apt-get update

# 安装vim
RUN apt-get install -y vim

# 安装git
RUN apt-get install -y git

# 设置工作目录
WORKDIR /data