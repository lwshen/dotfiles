# dotfiles

## Preview

![dotfiles](dotfiles.png)

## Install

**via wget:**

```bash
wget -qO- https://gh.slw.im/raw.githubusercontent.com/lwshen/dotfiles/main/install.sh | sed -e "s/raw.githubusercontent.com/gh.slw.im\/raw.githubusercontent.com/g" | sed -e "s/github.com/gh.slw.im\/github.com/g" | bash
```

or

```bash
sh -c "$(wget https://raw.githubusercontent.com/lwshen/dotfiles/main/install.sh -O -)"
```

or

```bash
wget -qO- https://gh.slw.im/raw.githubusercontent.com/lwshen/dotfiles/main/install.sh | sed -e "s/raw.githubusercontent.com/cdn.staticaly.com\/gh/g" | sed -e "s/github.com/hub.fastgit.xyz/g" | bash
```

**via curl:**

```bash
curl -sS -o- https://gh.slw.im/raw.githubusercontent.com/lwshen/dotfiles/main/install.sh | sed -e "s/raw.githubusercontent.com/gh.slw.im\/raw.githubusercontent.com/g" | sed -e "s/github.com/gh.slw.im\/github.com/g" | bash
```

or

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/lwshen/dotfiles/main/install.sh)"
```

or

```bash
curl -sS -o- https://gh.slw.im/raw.githubusercontent.com/lwshen/dotfiles/main/install.sh | sed -e "s/raw.githubusercontent.com/cdn.staticaly.com\/gh/g" | sed -e "s/github.com/hub.fastgit.xyz/g" | bash
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
