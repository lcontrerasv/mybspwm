# My bsPwm

## _Step-by-step guide to personalize your work environment_

## Requirements

You need a Linux based operating system and a user with a zsh shell configured.

## Configuration

##### Libraries and Tools setup

First, install the following necessary tools and libraries:

```sh
sudo apt install -y build-essential cmake cmake-data pkg-config git vim kitty bat lsd flameshot i3lock python3-sphinx python3-xcbgen xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev libxinerama1 libxinerama-dev libcairo2-dev libxcb1-dev libxcb-composite0-dev xcb-proto libxcb-image0-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libuv1-dev libnl-genl-3-dev meson libxext-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-present-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre3 libpcre3-dev libevdev-dev uthash-dev libx11-xcb-dev libxcb-glx0-dev libev-dev rofi feh imagemagick shred scrub
```

Note: if you get a error for xcb, don't worry and just remove from the previous line and run the command again.

## Install and config bspwm

Clone the following git repositories to ~/Downloads folder and build:

| Name  | URL                                               |
| ----- | ------------------------------------------------- |
| bspwm | [https://github.com/baskerville/bspwm.git][bspwm] |
| sxhkd | [https://github.com/baskerville/sxhkd.git][sxhkd] |

```sh
git clone https://github.com/baskerville/bspawm.git
cd bspawm
make & sudo make install
```

```sh
git clone https://github.com/baskerville/sxhkd.git
cd bspawm
make & sudo make install
```

#### bspwm configuration file

Copy the following samples files from this repository to your ~/.config folder:

```sh
mkdir ~/.config/{bspwm,sxhkd}
cp ./examples/bspwmrc ~/.config/bspwm
cp ./examples/sxhkdrc ~/.config/sxhkd

mkdir ~/.config/bspwm/scripts
cp ./scripts/bspwm_resize ~/.config/bspwm/scripts/
```

#### Install polybar

Clone polybar repository into ~/Downloads folder:

```sh
cd ~/Downloads
git clone --recursive https://github.com/polybar/polybar.git
cd polybar
mkdir build
cd build
cmake ..
make -j$(nproc)
sudo make install
```

##### Config polybar (blue-sky)

Clone blue-sky repository into ~/Downloads folder:

```sh
cd ~/Downloads
git clone https://github.com/VaughnValle/blue-sky.git
cd blue-sky
sudo cp polybar/fonts/* /usr/share/fonts/truetype/
mkdir ~/.config/polybar
cp -r polybar/* ~/.config/polybar
fc-cache -v
mkdir -p ~/.config/rofi/themes
cp nord.rasi ~/.config/rofi/themes
```

#### Install Picom

Clone picom repository into ~/Downloads folder:

```sh
cd ~/Downloads
git clone https://github.com/ibhagwan/picom.git
cd picom
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build & sudo ninja -C build install
```

##### Config picom

```sh
mkdir ~/.config/picom
cp ./examples/picom.conf ~/.config/picom/
```

#### Install powerLevel10k

```sh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
```

Note: You could install it for the privileged user.

#### Install FZF

```sh
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

## Extras

#### Changing the system font

```sh
cd ~/Downloads
wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Hack.zip
sudo unzip Hack.zip -d /usr/local/share/fonts
rm -rf Hack.zip
```

#### ZSH Plugin

Copy all the plugin in ´plugins´folder into ´/usr/share/´

```sh
sudo cp -r ./plugins/* /usr/share/
```

Then edit ~/.zshrc, and add the following lines:

```sh
source /usr/share/zsh-sudo/sudo.plugin.zsh
source /usr/share/zsh-git/git.plugin.zsh
```

#### NeoVIM

```sh
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
cd /opt
sudo wget https://github.com/neovim/neovim/releases/download/v0.9.5/nvim-linux64.tar.gz
sudo tar -xf nvim-linux64.tar.gz
```

#### i3Lock Facy

```sh
git clone https://github.com/meskarune/i3lock-fancy.git
cd i3lock-fancy/
sudo make install
```

Remenber add the custom alias for nvim.

[//]: # "These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax"
[git-repo-url]: https://github.com/lcontrerasv/mybspwm.git
[baskerville]: https://github.com/baskerville
[bspwm]: https://github.com/baskerville/bspwm.git
[sxhkd]: https://github.com/baskerville/sxhkd.git
[pbar]: https://github.com/polybar/polybar.git
[blsky]: https://github.com/VaughnValle/blue-sky.git
