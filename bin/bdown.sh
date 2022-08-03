#/bin/bash

url=$1
# url是直链地址，默认从第一个参数中获取
# 在命令行长度有限制的设备上(比如OpenWrt)
# 也可以直接把url设置成直链地址后运行脚本(不需要参数)
# 例如: url="http://allall02.baidupcs.com/file/......"

#fn=$(echo $url | grep -P 'fin=.*?&' -o)
fn=$(echo $url | sed 's/&/\n/g' | grep 'fin=')
fn=$(echo $fn | sed "s/fin=//g" | sed "s/&//g")
fn=$(printf $(echo -n "$fn" | sed 's/\\/\\\\/g;s/\(%\)\([0-9a-fA-F][0-9a-fA-F]\)/\\x\2/g')"\n")

agent="netdisk;7.0.3.2;PC;PC-Windows;10.0.17763"

if aria2c --help >/dev/null 2>&1; then
  aria2c --user-agent="$agent" -x 4 -s 4 -o "$fn" "$url"
else
  if curl --help >/dev/null 2>&1; then
    curl --user-agent "$agent" -o "$fn" "$url"
  else
    if wget --help >/dev/null 2>&1; then
      wget --user-agent "$agent" -O "$fn" "$url"
    else
      echo "需要安装以下软件之一: aria2c, curl, wget"
    fi
  fi
fi
