vim-config
==========
My vim config.

```bash
#!/bin/bash
mv ~/.vim{,.bak}
git clone https://github.com/inversion/vim-config ~/.vim
cd ~/.vim
git submodule update --init --recursive
ln -s ~/.vim/vimrc ~/.vimrc
```

Local changes go in ~/.vimrc.local
