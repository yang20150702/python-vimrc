# python-vimrc
vim配置，仅提供Python配置

## Install

使用ubuntu16环境，首先安装vim，建议anacoda提供的Python环境（**方便**）。

> unix环境都可使用

```
sudo apt-get install vim
pip install yapf autopep8 flake8
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

> vim的低版本默认不支持Python3，可以手动编译vim，进行install。最新版本的vim默认支持Python3

## 使用

将该仓库clone到本地，将.vimrc移动到相应用户的根目录。

```
git clone https://github.com/yang20150702/python-vimrc.git ~/
```

在 **普通模式**下，输入 `PluginInstall`。会默认安装所有vimrc内配置的插件。

`jk` 快捷键，用于退出编辑模式。
