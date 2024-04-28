#!/bin/bash

# 跳转到 libpcap 源代码目录
cd libpcap

# 构建 amd64 版本
./configure --host=x86_64-linux-gnu CC=x86_64-linux-gnu-gcc CXX=x86_64-linux-gnu-g++ --prefix=/dist/amd64/pcap
make
make install
make clean
tree /dist/amd64/pcap/lib -h

# 构建 arm64 版本
./configure --host=aarch64-linux-gnu CC=aarch64-linux-gnu-gcc CXX=aarch64-linux-gnu-g++ --prefix=/dist/arm64/pcap
make
make install
make clean
tree /dist/arm64/pcap/lib -h

# 准备目录结构
mkdir -p /libpcap/arm64/lib /libpcap/arm64/include
mkdir -p /libpcap/amd64/lib /libpcap/amd64/include

# 移动文件到指定目录
mv /dist/arm64/pcap/lib/* /libpcap/arm64/lib/
mv /dist/arm64/pcap/include/* /libpcap/arm64/include/
mv /dist/amd64/pcap/lib/* /libpcap/amd64/lib/
mv /dist/amd64/pcap/include/* /libpcap/amd64/include/

