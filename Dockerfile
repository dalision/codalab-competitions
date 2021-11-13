FROM python:2.7.17
#change apt source || make sure sources.list in curdir before excuse the script use ustc source not ali
RUN rm /etc/apt/sources.list && mkdir -p /etc/apt
COPY sources.list ./etc/apt/sources.list 
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32 && apt-get update

# For nodejs
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get install -y npm netcat nodejs python-dev libmemcached-dev
RUN npm config set registry https://registry.npm.taobao.org
#change git&pip source
RUN git config --global http.sslverify false && mkdir -p ~/.pip && touch ~/.pip/pip.conf
RUN echo "[global]" >> ~/.pip/pip.conf && echo "index-url = https://pypi.tuna.tsinghua.edu.cn/simple" >> ~/.pip/pip.conf
RUN pip install --upgrade pip  # make things faster, hopefully

#make sure to change github.com -> github.com.cnpmjs.org in git clone
COPY codalab/requirements/common.txt requirements.txt 
RUN pip install -r requirements.txt

WORKDIR /app/codalab

