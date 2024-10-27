#!/bin/sh
#adapted from https://github.com/cavalleria/dotfiles/blob/main/install.sh

set -e

# functions
link_directory()
{
    SRC_DIR=$1
    DST_DIR=$2
    if [ ! -d $DST_DIR ]; then
        ln -s $SRC_DIR $DST_DIR
    else
        echo $DST_DIR "already exist, skip linking"
    fi
}
link_file()
{
    SRC_FILE=$1
    DST_FILE=$2
    if [ ! -f $DST_FILE ]; then
        ln -s $SRC_FILE $DST_FILE
    else
        echo $DST_FILE "already exist, skip linking"
    fi
}

# download
git_clone()
{
    if [ ! -d ~/.my_config ]; then
        git clone https://github.com/lwshen/dotfiles.git ~/.my_config
    fi
    if [ ! -d ~/.my_config/oh-my-zsh ]; then
        git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.my_config/oh-my-zsh
        link_directory ~/.my_config/oh-my-zsh ~/.oh-my-zsh
    fi
    if [ ! -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]; then
        git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    fi
    if [ ! -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-completions ]; then
        git clone --depth=1 https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-completions
    fi
    if [ ! -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]; then
        git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    fi
    if [ ! -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ]; then
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    fi
    if [ ! -f ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/headline.zsh-theme ]; then
        wget https://raw.githubusercontent.com/Moarram/headline/main/headline.zsh-theme -P ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes
    fi
    echo "-- git clone OK"
}

# folders
link_directory_list()
{
    link_directory ~/.my_config/oh-my-zsh ~/.oh-my-zsh

    echo "-- link directories OK"
}

# files
link_file_list()
{
    if [ ! -f ~/.my_config/home/.pathrc.local ]; then
        echo ".pathrc.local not found, creating..."
        touch ~/.my_config/home/.pathrc.local
    fi
    link_file  ~/.my_config/home/.gitconfig ~/.gitconfig
    link_file  ~/.my_config/home/.gitmessage ~/.gitmessage
    link_file  ~/.my_config/home/.gitignore_global ~/.gitignore_global
    link_file  ~/.my_config/home/.vimrc ~/.vimrc
    link_file  ~/.my_config/home/.zshrc ~/.zshrc
    link_file  ~/.my_config/home/.pathrc ~/.pathrc
    link_file  ~/.my_config/home/.pathrc.mac ~/.pathrc.mac
    link_file  ~/.my_config/home/.pathrc.local ~/.pathrc.local
    link_file  ~/.my_config/home/.aliasrc ~/.aliasrc
    link_file  ~/.my_config/home/.condarc ~/.condarc
    link_file  ~/.my_config/home/.npmrc ~/.npmrc
    link_file  ~/.my_config/home/.tmux.conf ~/.tmux.conf
    link_file  ~/.my_config/home/.tmux.conf.local ~/.tmux.conf.local
    link_file  ~/.my_config/home/.p10k.zsh ~/.p10k.zsh
    mkdir -p ~/.cargo
    link_file ~/.my_config/home/.cargo/config ~/.cargo/config
    mkdir -p ~/.m2
    link_file ~/.my_config/home/.m2/settings.xml ~/.m2/settings.xml
    echo "-- link files OK"
}

hello()
{
    echo "------------------------------------------"
    echo ""
    echo "      Welcome to use Ryo's Config"
    echo ""
    echo "------------------------------------------"
}

main()
{
    hello
    git_clone
    # link_directory_list
    link_file_list
}

main "$@"
