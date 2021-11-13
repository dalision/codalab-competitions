#!/bin/sh
###
 # @Author: Dilision
 # @Date: 2021-11-13 10:43:16
 # @Description: 
### 

pip_source=https://pypi.tuna.tsinghua.edu.cn/simple
apt_source=https://mirrors.ustc.edu.cn/ubuntu/
docker_source=http://f1361db2.m.daocloud.io
npm_source=https://registry.npm.taobao.org
git_file=
#pip
which pip >/dev/null 2>&1
if [ $? -eq 0 ]; then
mkdir -p ~/.pip
echo "[global]" > ~/.pip/pip.conf
echo "index-url = ${pip_source}" >> ~/.pip/pip.conf
fi

# git
which git >/dev/null 2>&1
if [ $? -eq 0 ]; then
if[ ! -z $git_file ];then
git config --global http.sslverify false
sed -i "s/github.com/github.com.cnpmjs.org/g" $git_file
if
fi

#apt-get
echo deb $apt_source bionic main restricted universe multiverse > /etc/apt/sources.list
echo deb-src $apt_source bionic main restricted universe multiverse >> /etc/apt/sources.list
echo deb $apt_source bionic-updates main restricted universe multiverse >> /etc/apt/sources.list
echo deb-src $apt_source bionic-updates main restricted universe multiverse >> /etc/apt/sources.list
echo deb $apt_source bionic-backports main restricted universe multiverse >> /etc/apt/sources.list
echo deb-src $apt_source bionic-backports main restricted universe multiverse >> /etc/apt/sources.list
echo deb $apt_source bionic-security main restricted universe multiverse >> /etc/apt/sources.list
echo deb-src $apt_source bionic-security main restricted universe multiverse >> /etc/apt/sources.list
echo deb $apt_source bionic-proposed main restricted universe multiverse >> /etc/apt/sources.list
echo deb-src $apt_source bionic-proposed main restricted universe multiverse >> /etc/apt/sources.list

#docker 
which docker >/dev/null 2>&1
if [ $? -eq 0 ]; then
curl -sSL https://get.daocloud.io/daotools/set_mirror.sh | sh -s $docker_source
service docker restart
fi

#nmp
which nmp >/dev/null 2>&1
if [ $? -eq 0 ]; then
npm config set registry $npm_source
fi
