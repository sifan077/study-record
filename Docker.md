# Docker基本命令

## Ubuntu开启docker服务

### 1. 启动docker服务

```bash
sudo service docker start
```

### 2. 停止docker

```bash
sudo service docker stop
```

### 3. 重启docker

```bash
sudo service docker restart
```



## 1.容器生命周期管理

### 1.1 run 命令

**docker run ：**创建一个新的容器并运行一个命令

```bash
docker run [OPTIONS] IMAGE [COMMAND] [ARG...]
```

- **-d:** 后台运行容器，并返回容器ID；
- **-i:** 以交互模式运行容器，通常与 -t 同时使用；
- **-P:** 随机端口映射，容器内部端口**随机**映射到主机的端口
- **-p:** 指定端口映射，格式为：**主机(宿主)端口:容器端口**
- **-t:** 为容器重新分配一个伪输入终端，通常与 -i 同时使用；
- **--name="nginx-lb":** 为容器指定一个名称；
- **--dns 8.8.8.8:** 指定容器使用的DNS服务器，默认和宿主一致；
- **-m :**设置容器使用内存最大值；
- **--volume , -v:** 绑定一个卷

样例:

```bash
//使用docker镜像nginx:latest以后台模式启动一个容器,并将容器命名为mynginx。
docker run --name mynginx -d nginx

//使用镜像nginx以后台模式启动一个容器,并将容器的80端口映射到主机随机端口。
docker run -P -d nginx

//使用镜像 nginx:latest，以后台模式启动一个容器,将容器的 80 端口映射到主机的 80 端口,主机的目录 /data 映射到容器的 /data。
docker run -p 80:80 -v /data:/data -d nginx

//绑定容器的 8080 端口，并将其映射到本地主机 127.0.0.1 的 80 端口上。
docker run -p 127.0.0.1:80:8080/tcp ubuntu bash

//使用镜像nginx以交互模式启动一个容器,在容器内执行/bin/bash命令
docker run -it nginx:latest /bin/bash
```

### 1.2 start/stop/restart 命令

**docker start** :启动一个或多个已经被停止的容器

**docker stop** :停止一个运行中的容器

**docker restart** :重启容器

```bash
docker start 容器实例id或者名字
docker stop 容器实例id或者名字
docker restart 容器实例id或者名字
```

### 1.3 kill命令

**docker kill** :杀掉一个运行中的容器

```bash
docker kill 容器实例id或者名字
```

### 1.4 rm命令

**docker rm ：**删除一个或多个容器。

```bash
docker rm [OPTIONS] CONTAINER [CONTAINER...]
```

- **-f :**通过 SIGKILL 信号强制删除一个运行中的容器。
- **-l :**移除容器间的网络连接，而非容器本身。
- **-v :**删除与容器关联的卷。

样例:

```bash
//强制删除容器 db01、db02：
docker rm -f db01 db02

//移除容器 nginx01 对容器 db01 的连接，连接名 db：
docker rm -l db 

//删除容器 nginx01, 并删除容器挂载的数据卷：
docker rm -v nginx01

//删除所有已经停止的容器：
docker rm $(docker ps -a -q)
```

### 1.5 pause/unpause 命令

**docker pause** :暂停容器中所有的进程。

**docker unpause** :恢复容器中所有的进程。

```bash
docker pause CONTAINER [CONTAINER...]
docker unpause CONTAINER [CONTAINER...]
```

样例:

```
//暂停数据库容器db01提供服务。
docker pause db01
//恢复数据库容器 db01 提供服务。
docker unpause db01
```

### 1.6 create 命令

**docker create ：**创建一个新的容器但不启动它

用法同docker run。

```bash
docker create [OPTIONS] IMAGE [COMMAND] [ARG...]
```

样例:

```bash
// 使用docker镜像nginx创建一个容器,并将容器命名为mydocker
docker create  --name mydocker  nginx 
```

### 1.7 exec 命令

**docker exec ：**在运行的容器中执行命令

```bash
docker exec [OPTIONS] CONTAINER COMMAND [ARG...]
```

- **-d :**分离模式: 在后台运行
- **-i :**即使没有附加也保持STDIN 打开
- **-t :**分配一个伪终端

样例:

```bash
//在容器 mynginx 中以交互模式执行容器内 /root/run.sh 脚本:
docker exec -it mynginx /bin/sh /root/run.sh

//在容器 mynginx 中开启一个交互模式的终端:
docker exec -i -t  mynginx /bin/bash

//可以通过 docker ps -a 命令查看已经在运行的容器，然后使用容器 ID 进入容器。
```

## 2. 容器操作

### 2.1 ps命令

**docker ps :** 列出容器

默认只列出正在运行的容器。

```bash
docker ps [OPTIONS]
```

- **-a :**显示所有的容器，包括未运行的。
- **-f :**根据条件过滤显示的内容。
- **--format :**指定返回值的模板文件。
- **-l :**显示最近创建的容器。
- **-n :**列出最近创建的n个容器。
- **--no-trunc :**不截断输出。
- **-q :**静默模式，只显示容器编号。
- **-s :**显示总的文件大小。

输出详情介绍：

**CONTAINER ID:** 容器 ID。

**IMAGE:** 使用的镜像。

**COMMAND:** 启动容器时运行的命令。

**CREATED:** 容器的创建时间。

**STATUS:** 容器状态。

**PORTS:** 容器的端口信息和使用的连接类型（tcp\udp）。

**NAMES:** 自动分配的容器名称。

容器状态分为7种：

- created（已创建）
- restarting（重启中）
- running（运行中）
- removing（迁移中）
- paused（暂停）
- exited（停止）
- dead（死亡）

### 2.2 inspect 命令

**docker inspect :** 获取容器/镜像的元数据。

```bash
docker inspect [OPTIONS] NAME|ID [NAME|ID...]
```

- **-f :**指定返回值的模板文件。
- **-s :**显示总的文件大小。
- **--type :**为指定类型返回JSON。

### 2.3 top 命令

**docker top :**查看容器中运行的进程信息，支持 ps 命令参数。

```bash
docker top [OPTIONS] CONTAINER [ps OPTIONS]
```

容器运行时不一定有/bin/bash终端来交互执行top命令，而且容器还不一定有top命令，可以使用docker top来实现查看container中正在运行的进程。

```bash
//查看容器mymysql的进程信息。
docker top mymysql
```

### 2.4 attach 命令

**docker attach :**连接到正在运行中的容器。

```
docker attach [OPTIONS] CONTAINER
```

我自己的理解是基本同 `exec`命令 ，但是此命令退出后容器回关闭。

### 2.5 events 命令

**docker events :** 从服务器获取实时事件

```
docker events [OPTIONS]
```

- **-f ：**根据条件过滤事件；
- **--since ：**从指定的时间戳后显示所有事件;
- **--until ：**流水时间显示到指定的时间为止；

样例：

```
// 显示docker 2016年7月1日后的所有事件。
docker events  --since="1467302400"
// 显示docker 镜像为mysql:5.6 2016年7月1日后的相关事件。
docker events -f "image"="mysql:5.6" --since="1467302400" 
```

如果指定的时间是到秒级的，需要将时间转成时间戳。如果时间为日期的话，可以直接使用，如--since="2016-07-01"。

### 2.6 logs 命令

**docker logs :** 获取容器的日志

```
docker logs [OPTIONS] CONTAINER
```

- **-f :** 跟踪日志输出
- **--since :**显示某个开始时间的所有日志
- **-t :** 显示时间戳
- **--tail :**仅列出最新N条容器日志

样例:

```bash
// 跟踪查看容器mynginx的日志输出。
docker logs -f mynginx

//查看容器mynginx从2016年7月1日后的最新10条日志。
docker logs --since="2016-07-01" --tail=10 mynginx
```

### 2.7 wait 命令

**docker wait :** 阻塞运行直到容器停止，然后打印出它的退出代码。

```
docker wait [OPTIONS] CONTAINER [CONTAINER...]
```

### 2.8 export 命令

**docker export :**将文件系统作为一个tar归档文件导出到STDOUT。

```
docker export [OPTIONS] CONTAINER
```

- **-o :**将输入内容写到文件。

样例：

```
//将id为a404c6c174a2的容器按日期保存为tar文件。
docker export -o mysql-`date +%Y%m%d`.tar a404c6c174a2
```

### 2.9 port 命令

**docker port :**列出指定的容器的端口映射，或者查找将PRIVATE_PORT NAT到面向公众的端口。

```
docker port [OPTIONS] CONTAINER [PRIVATE_PORT[/PROTO]]
```

样例:

```
//查看容器mynginx的端口映射情况。
docker port mymysql
```

## 3. 容器rootfs命令

### 3.1 commit 命令

**docker commit :**从容器创建一个新的镜像。

```
docker commit [OPTIONS] CONTAINER [REPOSITORY[:TAG]]
```

- **-a :**提交的镜像作者；

  

- **-c :**使用Dockerfile指令来创建镜像；

  

- **-m :**提交时的说明文字；

  

- **-p :**在commit时，将容器暂停。

样例:

```
// 将容器a404c6c174a2 保存为新的镜像,并添加提交人信息和说明信息。
docker commit -a "runoob.com" -m "my apache" a404c6c174a2  mymysql:v1 
```

### 3.2 cp 命令

**docker cp :**用于容器与主机之间的数据拷贝。

```
docker cp 拷贝的路径 目标路径
```

- **-L :**保持源目标中的链接

样例:

```
//将主机/www/shentu目录拷贝到容器96f7f14e99ab的/www目录下。
docker cp /www/shentu 96f7f14e99ab:/www/

//将主机/www/shentu目录拷贝到容器96f7f14e99ab中，目录重命名为www。
docker cp /www/shentu 96f7f14e99ab:/www

将容器96f7f14e99ab的/www目录拷贝到主机的/tmp目录中。
docker cp  96f7f14e99ab:/www /tmp/
```

### 3.3 diff 命令

**docker diff :** 检查容器里文件结构的更改。

```
docker diff [OPTIONS] CONTAINER
```

样例:

```bash
//查看容器mymysql的文件结构更改。
docker diff mymysql
```

## 4. 镜像仓库

### 4.1  login/logout 命令

**docker login :** 登陆到一个Docker镜像仓库，如果未指定镜像仓库地址，默认为官方仓库 Docker Hub

**docker logout :** 登出一个Docker镜像仓库，如果未指定镜像仓库地址，默认为官方仓库 Docker Hub

```
docker login [OPTIONS] [SERVER]
docker logout [OPTIONS] [SERVER]
```

- **-u :**登陆的用户名
- **-p :**登陆的密码

基本同mysql命令行登陆。

样例:

登陆到Docker Hub

```
docker login -u 用户名 -p 密码
```

登出Docker Hub

```
docker logout
```

### 4.2 pull 命令

 **docker pull :** 从镜像仓库中拉取或者更新指定镜像

```
docker pull [OPTIONS] NAME[:TAG|@DIGEST]
```

- **-a :**拉取所有 tagged 镜像

  

- **--disable-content-trust :**忽略镜像的校验,默认开启

### 4.3  push 命令

**docker push :** 将本地的镜像上传到镜像仓库,要先登陆到镜像仓库

```
docker push [OPTIONS] NAME[:TAG]
```

- **--disable-content-trust :**忽略镜像的校验,默认开启

样例:

```
//上传本地镜像myapache:v1到镜像仓库中。

docker push myapache:v1
```

### 4.4 search 命令

**docker search :** 从Docker Hub查找镜像

```
docker search [OPTIONS] TERM
```

- **--automated :**只列出 automated build类型的镜像；
- **--no-trunc :**显示完整的镜像描述；
- **-f <过滤条件>:**列出收藏数不小于指定值的镜像。

样例：

```
//从 Docker Hub 查找所有镜像名包含 java，并且收藏数大于 10 的镜像
docker search -f stars=10 java
```

## 5. 本地镜像管理

### 5.1 images 命令

**docker images :** 列出本地镜像。

```
docker images [OPTIONS] [REPOSITORY[:TAG]]
```

- **-a :**列出本地所有的镜像（含中间映像层，默认情况下，过滤掉中间映像层）；
- **--digests :**显示镜像的摘要信息；
- **-f :**显示满足条件的镜像；
- **--format :**指定返回值的模板文件；
- **--no-trunc :**显示完整的镜像信息；
- **-q :**只显示镜像ID。

样例:

```
// 列出本地镜像中REPOSITORY为ubuntu的镜像列表。
docker images  ubuntu
```

### 5.2 rmi 命令

**docker rmi :** 删除本地一个或多个镜像。

```
docker rmi [OPTIONS] IMAGE [IMAGE...]
```

- **-f :**强制删除；
- **--no-prune :**不移除该镜像的过程镜像，默认移除；

### 5.3 tag 命令

**docker tag :** 标记本地镜像，将其归入某一仓库.

```
docker tag [OPTIONS] IMAGE[:TAG] [REGISTRYHOST/][USERNAME/]NAME[:TAG]
```

样例：

```
// 将镜像ubuntu:15.10标记为 shentu/ubuntu:v3 镜像。
docker tag ubuntu:15.10 shentu/ubuntu:v3
```

### 5.4 build 命令

**docker build** 命令用于使用 Dockerfile 创建镜像。

```
docker build [OPTIONS] PATH | URL | -
```

样例:

```
//使用当前目录的 Dockerfile 创建镜像，标签为 shentu/ubuntu:v1。
docker build -t shentu/ubuntu:v1 . 

//使用URL github.com/creack/docker-firefox 的 Dockerfile 创建镜像。
docker build github.com/creack/docker-firefox

//也可以通过 -f Dockerfile 文件的位置：
docker build -f /path/to/a/Dockerfile .
```

### 5.5 history 命令

**docker history :** 查看指定镜像的创建历史。

```
docker history [OPTIONS] IMAGE
```

- **-H :**以可读的格式打印镜像大小和日期，默认为true；
- **--no-trunc :**显示完整的提交记录；
- **-q :**仅列出提交记录ID。

样例:

```
//查看本地镜像runoob/ubuntu:v3的创建历史。
docker history runoob/ubuntu:v3
```

### 5.6 save 命令

**docker save :** 将指定镜像保存成 tar 归档文件。

```
docker save [OPTIONS] IMAGE [IMAGE...]
```

- **-o :**输出到的文件。

样例:

```
// 将镜像 runoob/ubuntu:v3 生成 my_ubuntu_v3.tar 文档
docker save -o my_ubuntu_v3.tar runoob/ubuntu:v3
```

### 5.7 load 命令

**docker load :** 导入使用 [docker save](https://www.runoob.com/docker/docker-save-command.html) 命令导出的镜像。

```
docker load [OPTIONS]
```

- **--input , -i :** 指定导入的文件，代替 STDIN。
- **--quiet , -q :** 精简输出信息。

### 5.8  import 命令

**docker import :** 从归档文件中创建镜像。

```
docker import [OPTIONS] file|URL|- [REPOSITORY[:TAG]]
```

- **-c :**应用docker 指令创建镜像；
- **-m :**提交时的说明文字；

样例:

```
// 从镜像归档文件my_ubuntu_v3.tar创建镜像，命名为shentu/ubuntu:v4
 import  my_ubuntu_v3.tar shentu/ubuntu:v4  
```

## 6. 查看信息

### 6.1 info 命令

docker info : 显示 Docker 系统信息，包括镜像和容器数。。

```
docker info [OPTIONS]
```

### 6.2 version 命令

docker version :显示 Docker 版本信息。

```
docker version
```

