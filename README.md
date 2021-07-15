# Unix/Linux 终端优化插件
支持的系统：Debian/Ubuntu/Mint/LMDE/CentOS/macOS/Arch/Manjaro

需要配合 zsh 使用才能达到最佳效果

### 优化介绍
* 集成 oh-my-zsh 插件进行终端优化，并自动适应不同系统
* 安装 vim 增强插件，具体内容见下文章
* 使用中科大镜像源加速 python
* 待续...

## 一、安装与更新
安装前请先安装 make 和 git ，安装过程依赖这两个命令！
### 1.1 安装
```bash
# 1. 克隆仓库到本地
git clone https://github.com/wl1524520/dotfiles.git ~/.dotfiles

# 2. 进入 .dotfiles 文件夹
cd ~/.dotfiles

# 3. 开始安装
make awesome

```

### 1.2 更新
```bash
# 进入 dotfiles 配置目录
cd ~/.dotfiles

# 更新最新配置文件到本地
make update
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
