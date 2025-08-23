#!/bin/bash

CONFIG_PATH=~/.config
DOTFILES_PATH=~/dotfiles

# 运行结果前，执行运行的命令，有利于复杂脚本调试
# 脚本只要发生错误，就终止执行（包括管道命令）
set -euxo pipefail

# 拉取git子模块
# git submodule update

set +e

# 处理nvim
ln -s $DOTFILES_PATH/nvim $CONFIG_PATH/nvim

# 处理tmux
rm -rf ~/.tmux.conf
ln -s $DOTFILES_PATH/tmux $CONFIG_PATH/tmux
ln -s $CONFIG_PATH/tmux/tmux.conf ~/.tmux.conf

# 处理zsh
rm -rf ~/.zshrc
ln -s $DOTFILES_PATH/zsh/zshrc ~/.zshrc
source ~/.zshrc

set -e
