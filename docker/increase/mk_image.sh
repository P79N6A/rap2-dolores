#!/usr/bin/env bash
PROJECT_NAME="rap2-dolores"
# 根据指令选择相应分支及image名
starttime=$(date +%Y-%m-%d\ %H:%M:%S)
echo $starttime

# tz.test.dr:5000/qy_jtzjingyingdaireport:1.0
image_name="tz.dev.dr:5000/qy_${PROJECT_NAME}:1.0"
branch="master"
if [ $1 == "prod" ];then
image_name="tz.prod.dr:5000/qy_${PROJECT_NAME}:2.0"
fi
if [ $1 == "preprod" ];then
image_name="tz.preprod.dr:5000/qy_${PROJECT_NAME}:2.0"
fi
if [ $1 == "test" ];then
image_name="tz.test.dr:5000/qy_${PROJECT_NAME}:1.0"
fi
if [ $2 ];then
branch=$2
fi
# 生成docker image

# 删除旧文件
rm -rf tmp
mkdir tmp
# 切换分支并打包
cd ../../
npm run build
# 复制整个项目
cd ../
# --exclude=**/node_modules/*
tar cfz ${PROJECT_NAME}.tgz --exclude=**/.DS_Store  --exclude=**/.cache-loader  --exclude=**/.git/*  ./${PROJECT_NAME}/
mv ./${PROJECT_NAME}.tgz ./${PROJECT_NAME}/docker/increase/tmp/
cd ./${PROJECT_NAME}/docker/increase/
# 生成docker image
docker rmi -f $image_name
echo '正在生成docker镜像'
docker build -f ./Dockerfile  -t $image_name ./

ttime=`date +"%Y-%m-%d %H:%M:%S"`
echo $starttime
echo $ttime

if [ $2 ];then
    docker push $image_name
fi
