# .dotfiles
My dotfiles

# About

The following is my dotfiles configuration on my 2021 MacBook Pro 14 inch. It also includes [Dynamic Island plugin](https://github.com/crissNb/Dynamic-Island-Sketchybar) I made for SketchyBar.
Overall my desktop is themed using [Catppuccin](https://github.com/catppuccin/catppuccin) or [Gruvbox Material](https://github.com/sainnhe/gruvbox-material). These two themes can be toggled by replacing catppuccin config with gruvbox config. I'm fan of vim bindings, so I'm using HJKL keys to navigate
between windows (see [SKHD](#skhd)), etc.

If you plan on using my dotfiles, I highly suggest you to fork the repository. As this is my personal dotfiles, some changes I make might be drastic.

# Table of Contents

* [Yabai](#yabai)
* [Neovim](#neovim)
* [SKHD](#skhd)
* [Sketchybar](#sketchybar)
* [Karabiner](#karabiner)
* [Alacritty](#alacritty)
* [Credits](#credits)

## Yabai

Yabai is a tiling window manager. I find it difficult to navigate between windows on Mac, especially because it doensn't have advanced window snapping built-in.
By using a tiling window manager, I can control all of my windows just by using a keyboard in combination with [SKHD](#skhd).

Some of the apps are ignored by Yabai's tiling window manager system, as they were causing trouble when used with Yabai. E.g. Unity.

I use Yabai with SIP enabled.

I have dual monitor configuration with following workspace setup (mostly for game development):

### Workspaces
|Shortcut|Workspace|
|--------|---------|
|`Hyper + 1`|Browser|
|`Hyper + 2`|Misc.|
|`Hyper + 3`|Music|
|`Hyper + 4`|Discord|
|`Hyper + Z`|Terminal|
|`Hyper + A`|Unity|
|`Hyper + S`|Misc. / Browser|
|`Hyper + D`|PDF Viewer (Zathura)|
|`Hyper + F`|Browser|

### Keybindings
|Shortcut|Description|
|--------|-----------|
|`Hyper + Shift + H/J/K/L`|Focus window|
|`Hyper + Control + H/J/K/L`|Resize window|
|`Hyper + Alt + H/J/K/L`|Move window in current monitor|
|`Hyper + Alt + N`|Move window to left monitor|
|`Hyper + Alt + M`|Move window to right monitor|
|`Hyper + R`|Rotate windows by 90 degrees|
|`Hyper + W`|Flip window positions vertically|
|`Hyper + G`|Toggle floating window|
|`Hyper + O`|Fill screen with floating window|
|`Hyper + Return`|Fill screen with non-floating window|
|`Hyper + Z/A/S/D/F/1/2/3/4`|Focus desktop|
|`Hyper + Alt + Z/A/S/D/F/1/2/3/4`|Move current window to another desktop|
|`Hyper + Left/Right/Up/Down (arrow keys)`|Window stacking|
|`Hyper + Tab`|Next stacked window|
|`Hyper + Shift + Tab`|Previous stacked window|

### Misc
|Shortcut|Description|
|--------|-----------|
|`Hyper + T`|Open new OS terminal window (Alacritty)|
|`Hyper + E`|Open finder|

## Neovim

I primarily use neovim as my code editor and IDE. My neovim configuration supports following languages:
- Java
- C# (works with Unity)
- Lua

See [nvim/lua/user/keymap.lua](https://github.com/crissNb/dotfiles/blob/6389b8dd84c993df4cb78546be7e3c800c5bd81e/nvim/lua/user/keymap.lua) for all keymaps.

## SKHD

The following are configured key bindings I have configured:
*the key `Hyper` is Tab + Q key. See [Karabiner](#karabiner)*

## Sketchybar

Coming Soon...

## Karabiner

Required for SKHD setup. Tab + Q (simultaeneously) acts as a `Hyper` key when it's being pressed with another key.
The only noticeable karabiner modification is `Hyper + HJKL` (Tab + Q + HJKL), which act as arrow keys.

## Alacritty

Alacritty is my weapon of choice. Nothing much has been configured to Alacritty, apart from catppuccin theme and disabling the window decorations.

## Credits

Part of my SKHD configuration and Yabai configuration (and their custom scripts) are from [Jesse Skelton](https://www.notion.so/Yabai-8da3b829872d432fac43181b7ff628fc)

.zshrc config by [Luke Smith](https://github.com/LukeSmithxyz/voidrice)

The majority of the sketchybar config is from [Felix Kratz](https://github.com/FelixKratz/dotfiles/)
