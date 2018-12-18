# Dotfiles 仓库 (Gentoo/Arch/Manjaro)

To keep submodules at their proper versions, you could include something like
`git submodule update --init --recursive` in your `install.conf.yaml`.

## 安装
```bash
# 1. 克隆仓库到本地
git clone https://github.com/wl1524520/arch-dotfiles.git ~/.dotfiles
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

## termite config sample
https://github.com/khamer/base16-termite
