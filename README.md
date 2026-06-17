# Unix/Linux 终端优化插件
支持的系统：Debian/Ubuntu/Mint/LMDE/CentOS/macOS/Arch/Manjaro

### 优化介绍
* 集成 oh-my-zsh 插件进行终端优化
* 集成 oh-my-bash 插件进行终端优化
* 安装 vim/neovim 增强配置，支持离线安装

## 一、安装教程
安装前请先安装 make 和 git ，安装过程依赖这两个命令！

1.1 克隆仓库到本地
```bash
git clone https://github.com/wl1524520/dotfiles.git ~/.dotfiles
```

1.2 进入 .dotfiles 文件夹
```bash
cd ~/.dotfiles
```

1.3 功能安装 (根据需要安装功能)

命令 | 说明
---|---
make vim | 安装 vim/neovim 配置
make vim-plugins | 预下载 vim 插件到本地（提交后可离线安装）
make ohmybash | 安装 oh-my-bash 优化
make ohmyzsh | 安装 oh-my-zsh 优化

1.4 更新
```bash
git pull
```


## 二、VIM 配置文件
本配置文件适用于 vim 和 neovim ，其它类 vim 编辑器未做测试

### 2.1 插件管理
使用 vim-plug 管理插件。安装后在 vim 中执行：

命令 | 功能
---|---
:PlugInstall | 安装插件
:PlugUpdate | 更新插件
:PlugClean | 清理不用的插件

### 2.2 插件列表
插件 | 功能
---|---
jiangmiao/auto-pairs | 自动补全配对的括号等
chr4/nginx.vim | nginx 配置语法高亮
itchyny/lightline.vim | 底部状态栏
morhetz/gruvbox | 主题

## 三、快捷脚本
命令 | 参数 | 功能
---|---|---
lnmp | start/stop/restart | CentOS/Debian/Ubuntu 启动/停止/重启 lnmp 服务

## 四、自定义配置（优先级最高）
本配置会自动检测是否存在 ~/.profile_user 文件，如果存在，则会自动加载！

例如：在 ~/.profile_user 文件中增加如下变量，则可以开启远程 Linux 系统的 vim 真彩色主题
```bash
export COLORTERM='truecolor'
```
