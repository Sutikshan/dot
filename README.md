Basic dotfiles for Tmux, Vim and Zsh
------------------------------------
Dotfiles used with Vim, Tmux and Zsh on OSX and Linux.

Install on Mac and Linux
------------------------

```bash
git clone https://github.com/anupvarghese/dotfiles ~/.dotfiles
cd ~/.dotfiles && ./install.sh
chsh /bin/zsh # if needed
```

Plugin maintanance
------------------

After installation each tool will install its own dependencies automatically when run.

To force Tmux to update all plugins use `Ctrl+A I`.

To update Zsh plugins use `zplug update`

To update Vim plugins use `:PlugUpdate`

On mac `brew installl reattach-to-user-namespace` is required to run tmux properly

Fonts
-----

Nerd fonts has to be enabled to show icons.

```shell
brew tap caskroom/fonts
brew cask install font-hack-nerd-font
```
