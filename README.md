# Dotfiles 仓库 (Debian/Ubuntu/Mint/LMDE/CentOS/macOS/Arch/Manjaro)

To keep submodules at their proper versions, you could include something like
`git submodule update --init --recursive` in your `install.conf.yaml`.

## 安装
```bash
# 1. 克隆仓库到本地
git clone https://github.com/wl1524520/dotfiles.git ~/.dotfiles
# 2. 进入 .dotfiles 文件夹
cd ~/.dotfiles
# 3. 开始安装
make link
```

## submodule
```bash
# add submodule
git submodule add https://github.com/anishathalye/dotbot.git
git submodule add https://github.com/robbyrussell/oh-my-zsh.git

# update submodule
git submodule update --init --remote
```

## 设置默认 python 版本
直接执行这两个命令即可：
```bash
sudo update-alternatives --install /usr/bin/python python /usr/bin/python2 100
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 150
```
如果要切换到Python2，执行：
```bash
sudo update-alternatives --config python
```

