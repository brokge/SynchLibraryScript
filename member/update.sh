#!/bin/bash

#按需配置
dirParent="../../test/"

childDir="FlowTag/"

#接收参数
#接收 相对脚本命令的git仓库命令
if [ -n "$1" ];then
    echo ":shell:dirParent $1"
    $dirParent=$1
else
     echo ":shell:dirParent $dirParent"
fi

# 接收git项目路径
if [ -n "$2" ];then
    echo ":shell:dirParent $2"
    $childDir=$2
else
    echo ":shell:childDir $childDir"
fi


git --version

#下面不用改动
envDir=$dirParent$childDir

echo ":shell:$envDir"
#判断文件夹是否存在
if [ -d $envDir ];then
     cd $envDir
     echo ":shell:current branch"
     git branch
     echo ":shell:checkout branch develop"
     git checkout develop
     git branch
     git pull
else
    #mkdir $dir
    echo ":shell:不存在这个路径 cd $dirParent$childDir"

    if [ ! -d $dirParent ];then
        mkdir $dirParent
    fi

    cd $dirParent
    echo ":shell:cd $dirParent"
    git clone git@git.2dfire-inc.com:yusuzi/FlowTag.git
    cd $childDir
    git checkout develop
    git branch
fi


