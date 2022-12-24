# .dotfiles
My dotfiles

About
=====
The following is my dotfiles configuration on my 2021 MacBook Pro 14 inch. It also includes [Dynamic Island plugin](https://github.com/crissNb/Dynamic-Island-Sketchybar) I made for SketchyBar.
Overall my desktop is themed using [Catppuccin](https://github.com/catppuccin/catppuccin) or [Gruvbox Material](https://github.com/sainnhe/gruvbox-material). These two themes can be toggled by replacing catppuccin config with gruvbox config. I'm fan of vim bindings, so I'm using HJKL keys to navigate
between windows (see (SKHD)[#skhd]), etc.

Table of Contents
=================
[Yabai](#yabai)
[Neovim](#neovim)
[SKHD](#skhd)
[Sketchybar](#sketchybar)
[Karabiner](#karabiner)
[Alacritty](#alacritty)
[Credits](#credits)

Yabai
=====
Yabai is a tiling window manager. I find it difficult to navigate between windows on Mac, especially because it doensn't have advanced window snapping built-in.
By using a tiling window manager, I can control all of my windows just by using a keyboard in combination with [SKHD](#SKHD).

Some of the apps are ignored by Yabai's tiling window manager system, as they were causing trouble when used with Yabai. E.g. Unity.

I use Yabai with SIP enabled.

I have dual monitor configuration with following workspace setup (mostly for game development):

1 - Mail

2 - Browser

3 - Music

4 - Discord

z - Terminal

a - Unity

s - Neovim for Unity scripting

d - Everything else / Browser

f - Everything else

Neovim
======
I primarily use neovim as my code editor and IDE. My neovim configuration supports following languages:
- Java
- C# (works with Unity)
- Lua

See `nvim/lua/user/keymap.lua` for all keymaps.

SKHD
====
The following are configured key bindings I have configured:
*the key `hyper` is capslock key. See (Karabiner)[#karabiner]*
## Yabai Keybindings
`hyper - u` - Start yabai

`hyper - y` - Start yabai
##

`hyper - shift - h/j/k/l` - Focus window

`hyper - control - h/j/k/l` - Resize window

`hyper -  alt - h/j/k/l` - Move window in current monitor

`hyper - alt - n` - Move window to left monitor

`hyper - alt - m` - Move window to right monitor
##

`hyper - r` - Rotate windows by 90 degrees

`hyper - w` - Flip window positions vertically
##

`hyper - g` - Toggle floating window

`hyper - o` - Fill screen with floating window

`hyper - return` - Fill screen with non-floating window
##

`hyper - z/a/s/d/f/1/2/3/4` - Focus desktop

`hyper - alt - z/a/s/d/f/1/2/3/4` - Move current window to another desktop

##

`hyper - left/right/up/down (arrow keys)` - Window stacking

`hyper - tab` - Next stacked window

`hyper - shift - tab` - Previous stacked window

## Misc
`hyper - t` - Open new OS terminal window (kitty)

`hyper - e` - Open finder

`hyper - q` - killall Dock <-- this is sometimes needed, because after a while switching space animation becomes odd for some reason.

Sketchybar
==========
coming soon

Karabiner
=========
Required for SKHD setup. Tab + Q (simultaeneously) acts as a `Hyper` key when it's being pressed with another key.
The only noticeable karabiner modification is `Hyper + HJKL` (Tab + Q + HJKL), which act as arrow keys.

Alacritty
=====
Alacritty is my weapon of choice. Nothing much has been configured to Alacritty, apart from catppuccin theme and disabling the window decorations.

Credits
=======
Part of my SKHD configuration and Yabai configuration (and their custom scripts) are from [Jesse Skelton](https://www.notion.so/Yabai-8da3b829872d432fac43181b7ff628fc)

.zshrc config by [Luke Smith](https://github.com/LukeSmithxyz/voidrice)

The majority of the sketchybar config is from [Felix Kratz](https://github.com/FelixKratz/dotfiles/)
