# dotfiles

## Install

via wget:
```bash
sh -c "$(wget https://raw.githubusercontent.com/lwshen/dotfiles/main/install.sh -O -)"
```

via curl:
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/lwshen/dotfiles/main/install.sh)"
```

## Before install

- Install **Git**
```bash
brew install git
```

- Change default shell
```bash
chsh -s /bin/zsh
```

- Backup dotfiles, eg .vimrc, .zshrc, .gitconfig and so on.