# Dotfiles 仓库
支持的系统：Debian/Ubuntu/Mint/LMDE/CentOS/macOS/Arch/Manjaro

## 一、安装
```bash
# 1. 克隆仓库到本地
git clone https://github.com/wl1524520/dotfiles.git ~/.dotfiles

# 2. 进入 .dotfiles 文件夹
cd ~/.dotfiles

# 3. 开始安装
make update
make link
make vim
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

## 三、子模块添加与更新
```bash
# 添加
git submodule add https://github.com/robbyrussell/oh-my-zsh.git

# 更新
git submodule update --init --remote
```

## 关于 Windows Subsystem Linux 安全警告
手动编辑 /etc/profile
在最后面添加如下变量以关闭 COMPFIX
```
export WSL=1
```

## 四、设置默认 python 版本
直接执行这两个命令即可：
```bash
sudo update-alternatives --install /usr/bin/python python /usr/bin/python2 100
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 150
```
如果要切换到Python2，执行：
```bash
sudo update-alternatives --config python
```

