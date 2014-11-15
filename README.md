# Dotfiles
## sync dotfiles
run sync.sh to rsync all dotfiles to ~/  
`$ sh sync.sh`

## Setup vim
Using Vundle to manage all plugins:
[Vundle github](https://github.com/gmarik/Vundle.vim)

1. Set up [Vundle]:

   `$ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
   
2. sync dotfiles (.vimrc)
3. Install plugins

	Launch `mvim` and run `:PluginInstall`
    See what plugins you have by running `:PluginList`

4. Setup Tern: [Tern github](https://github.com/marijnh/tern_for_vim)

    install the tern server by running `npm install` in the `~/.vim/bundle/tern_for_vim` directory.








