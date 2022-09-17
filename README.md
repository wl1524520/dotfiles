# Unix/Linux 终端优化插件
支持的系统：Debian/Ubuntu/Mint/LMDE/CentOS/macOS/Arch/Manjaro

### 优化介绍
* 集成 oh-my-zsh 插件进行终端优化
* 集成 oh-my-bash 插件进行终端优化
* 安装 vim 增强插件，具体内容见下文章
* 使用中科大镜像源加速 python
* 待续...

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
make vim | 安装 vim 优化
make ohmybash | 安装 oh-my-bash 优化
make ohmyzsh | 安装 oh-my-zsh 优化
make python | 配置 python 国内源

1.4 更新
```bash
git pull
```


## 二、VIM 配置文件
本配置文件适用于 vim 和 neovim ， 其它类 vim 编辑器未做测试

### 2.1 插件管理
命令 | 功能
---|---
:PluginInstall | 安装插件
:PluginClean | 清理不用的插件
:PluginUpdate | 更新已有插件

### 2.2 插件列表
插件 | 功能
---|---
ervandew/supertab | SuperTab使Tab快捷键具有更快捷的上下文提示功能。 也就是一种自动补全插件。
honza/vim-snippets | 自动补全代码
SirVer/ultisnips | 自动补全代码
jiangmiao/auto-pairs | 自动补全配对的括号等
itchyny/lightline.vim | 底部状态栏
morhetz/gruvbox | 主题
posva/vim-vue | vue 语法高亮

## 三、快捷脚本
命令 | 参数 | 功能
---|---|---
lnmp | start/stop/restart | CentOS 7 启动/停止/重启 lnmp 服务

## 四、自定义配置（优先级最高）
本配置插件会自动检测是否存在 ~/.profile_user 文件，如果存在，则会自动加载！

例如：在 ~/.profile_user 文件中增加如下变量，则可以开启远程 Linux 系统的 vim 主题颜色配置
```bash
export COLORTERM='truecolor'
```
