# 使用Ubuntu作为基础镜像
FROM ubuntu:latest

# 维护者信息
LABEL maintainer="v1ll4n"

# 避免安装过程中由于时区选择等待用户输入
ENV DEBIAN_FRONTEND=noninteractive

# 更新软件包列表，并安装必要的包
RUN apt update -y && \
    apt install -y git \
                   flex \
                   bison \
                   tree \
                   make \
                   gcc-x86-64-linux-gnu \
                   g++-x86-64-linux-gnu \
                   gcc-aarch64-linux-gnu \
                   g++-aarch64-linux-gnu

# 定义工作目录
WORKDIR /workspace

# 你可以在这里克隆你需要的库，如libpcap
RUN git clone https://github.com/the-tcpdump-group/libpcap.git && \
    cd libpcap && \
    git checkout libpcap-1.9.1

# 设置默认的构建命令
CMD ["bash"]

