# Dotfiles 仓库 (Debian/Ubuntu/Mint/LMDE/CentOS/macOS/Arch/Manjaro)

To keep submodules at their proper versions, you could include something like
`git submodule update --init --recursive` in your `install.conf.yaml`.

## 一、安装
```bash
# 1. 克隆仓库到本地
git clone https://github.com/wl1524520/dotfiles.git ~/.dotfiles
# 2. 进入 .dotfiles 文件夹
cd ~/.dotfiles
# 3. 开始安装
make link
```

## 二、VIM 配置文件
本配置文件适用于 vim 和 neovim ， 其它类 vim 编辑器未做测试

### 2.1 插件管理
命令 | 功能
---|---
:PluginInstall | 安装插件
:PluginClean | 清理不用的插件
:PluginUpdate | 更新已有插件

### 2.2插件列表
插件 | 功能
---|---
ervandew/supertab | SuperTab使Tab快捷键具有更快捷的上下文提示功能。 也就是一种自动补全插件。
honza/vim-snippets | 自动补全代码
SirVer/ultisnips | 自动补全代码
jiangmiao/auto-pairs | 自动补全配对的括号等
itchyny/lightline.vim | 底部状态栏
morhetz/gruvbox | 主题

## 三、submodule
```bash
# add submodule
git submodule add https://github.com/anishathalye/dotbot.git
git submodule add https://github.com/robbyrussell/oh-my-zsh.git

# update submodule
git submodule update --init --remote
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

