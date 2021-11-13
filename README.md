<!--
 * @Author: Dilision
 * @Date: 2021-11-13 11:09:58
 * @Description: 
-->


## 此版本为[codalab](https://github.com/codalab/codalab-competitions)安装国内加速版本

**change：**

- **Dockerfile** `docker容器中实现git,apt-get,pip,npm镜像加速`
- **install**         `本机实现npm,pip,dockerhub,apt-get,git镜像加速,以及配置Dockerfile加速所需文件sources.list,codalab/requirements/common.txt`

**tips:**

```
本机指令:
python->python2.7
pip->pip2
```

**quick start:**

```
#在root用户下运行
git clone https://github.com/dalision/codalab-competitions
cd codalab-competitions
cp .env_sample .env
pip install docker-compose
chmod a+x ./install.sh && ./install.sh
docker-compose up -d
```


