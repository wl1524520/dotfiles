# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 仓库概述

这是 Wang Lu 的个人 dotfiles 仓库，用于管理 shell (zsh/bash)、vim/neovim 等终端环境的配置文件。通过符号链接将配置部署到 `$HOME` 目录，由 Makefile 驱动安装流程。

## 安装命令

```bash
make vim        # 安装 vim/neovim 配置（符号链接 + 复制插件）
make vim-plugins # 预下载 vim 插件到 vendor/vim/（提交后可离线安装）
make ohmybash   # 安装 oh-my-bash（克隆上游仓库 + 符号链接 bashrc）
make ohmyzsh    # 安装 oh-my-zsh（克隆上游仓库 + 符号链接 zshrc）
```

安装依赖 `make` 和 `git`，需先 `git clone` 本仓库到 `~/.dotfiles`。

## 架构设计

### Shell 配置分层

```
~/.zshrc  ──(symlink)──> ~/.dotfiles/zshrc
~/.bashrc ──(symlink)──> ~/.dotfiles/bashrc
```

两个 shell 入口文件结构对称：
- 设置 `ZSH_CUSTOM` / `OSH_CUSTOM` 指向本仓库的 `zsh_custom/` / `osh_custom/`，使得自定义主题和插件随仓库版本管理
- 末尾统一 `source ~/.dotfiles/bashrc.d/custom.sh` 加载共享配置

### bashrc.d/ — 共享配置片段

无论使用 zsh 还是 bash，都会加载此目录下的配置：

| 文件 | 作用 |
|------|------|
| `custom.sh` | 通用别名 (`ll`, `dc`, `sail`)、PATH 设置、vim/nvim 别名、加载 `~/.profile_user` |
| `profile_user.sh` | 用户自定义扩展示例（如 `COLORTERM=truecolor` 开启远程 vim 真彩色） |

### 用户自定义扩展点

`custom.sh` 末尾会检测 `~/.profile_user` 文件，存在则自动 source。这是最高优先级的用户自定义入口，不在本仓库版本管理中。

### Vim/Neovim 配置

入口文件 `vimrcs/init.vim`，通过符号链接同时服务于 vim 和 neovim：
- `~/.vimrc` → `vimrcs/init.vim`
- `~/.config/nvim/init.vim` → `vimrcs/init.vim`

使用 **vim-plug** 管理插件。`install-vim.sh` 优先从 `vendor/vim/` 本地复制（离线安装），没有则走网络下载。插件预下载：`make vim-plugins`，下载后提交到仓库即可实现离线安装。

### 自定义主题

- `zsh_custom/themes/gentoo.zsh-theme` — oh-my-zsh 使用的 gentoo 主题
- `osh_custom/themes/wanglu/` — oh-my-bash 使用的 wanglu 主题

### bin/ — 快捷脚本

`bin/lnmp` — 管理 LNMP (nginx + php-fpm) 服务的脚本，支持 `start|stop|restart`，自动检测 Debian/Ubuntu/CentOS 并使用对应的 php-fpm 服务名。通过 `custom.sh` 中的 PATH 设置全局可用。

