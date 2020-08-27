# dotfiles
My (rather modest) dotfiles


# Requirements:
0. rxvt-unicode dmenu (recommended)
1. xmonad xmonad-contrib xmobar
    * On Manjaro (but probably all Arch-based distros) - [install from source](https://brianbuccola.com/how-to-install-xmonad-and-xmobar-via-stack/), because apparently the official packages are broken
    * On Fedora (and probably all Fedora-based distros) - install from the official packages
2. feh (background)
3. xscreensaver
4. scrot (screen capture, can use KDE's spectacle instead)
5. amixer (for audio controls, usually already installed)


# After installation:
1. ~/.config/xmobar/xmobarrc - change $HOME to actual $HOME value (xmobar does not evaluate environment variables)
2. ~/.gitconfig - set name & email
