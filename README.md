# dotfiles

## Install

via wget:
```bash
sh -c "$(wget https://raw.githubusercontent.com/lwshen/dotfiles/main/install.sh -O -)"
```

or

```bash
wget -qO- https://gitcode.net/shenlw66/dotfiles/-/raw/main/install.sh | sed -e "s/raw.githubusercontent.com/raw.fastgit.org/g" | sed -e "s/github.com/hub.fastgit.org/g" | bash
```

via curl:
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/lwshen/dotfiles/main/install.sh)"
```

or

```bash
curl -sS -o- https://gitcode.net/shenlw66/dotfiles/-/raw/main/install.sh | sed -e "s/raw.githubusercontent.com/raw.fastgit.org/g" | sed -e "s/github.com/hub.fastgit.org/g" | bash
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

- If occurs `gnutls_handshake() failed: The TLS connection was non-properly terminated.`
Run `git config --global http.sslVerify false` and manually link `.gitignore` file.