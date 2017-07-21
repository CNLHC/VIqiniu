# 概述
快速将文件上传到七牛,并得到外链。
# 安装
在`vundle`里添加

	Plugin "CNLHC/VIqiniu"

并执行`:BundleInstall"

# 配置

## 参数配置
在`.vimrc`中配置以下参数

1. `g:VIqiniu_Ak` 七牛账户的Access Key
2. `g:VIqiniu_SK` 七牛账户的Secret Key 
3. `g:VIqiniu_Bucket` 要上传的Bucket名
4. `g:VIqiniu_Domain` Bucket 绑定的域名 #域名后一定要加'/'


## 快捷键配置

默认配置

	map <leader>t :py Viqiniu_upbload()<CR>

可重新映射该函数的调用方法

#使用

参见加该Gif
[DEMO](http://os794rlwi.bkt.clouddn.com/Demo.gif)


