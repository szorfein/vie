<h1 align=center>sVIe</h1>

<p align="center"> <i>Sacrilege</i> * <i>Vi</i> * <i>Emacs</i></p>

###

<div align=center>

![GitHub last commit](https://img.shields.io/github/last-commit/szorfein/svie?style=for-the-badge&labelColor=101418&color=9ccbfb)
![GitHub Repo stars](https://img.shields.io/github/stars/szorfein/svie?style=for-the-badge&labelColor=101418&color=b9c8da)
![GitHub repo size](https://img.shields.io/github/repo-size/szorfein/svie?style=for-the-badge&labelColor=101418&color=d3bfe6)

</div>

###

<p align="center" style="padding: 8px 0 16px 0;">
Aesthetic Modular <b>Neovim</b> configuration that focuses to be <b>intuitive</b> and <b>fast</b>.
</p>

![Vibe with sVIe Dasboard](https://github.com/szorfein/unix-portfolio/raw/master/Vibe/Neow.jpg)
![Vibe with sVIe](https://github.com/szorfein/unix-portfolio/raw/master/Vibe/full.jpg)

## ✨ Features

### Aesthetic

- All colors with [Catppuccin](https://github.com/catppuccin/nvim)
- Syntax highlighting with [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- Git integration with [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- Statusline, Winbar, and Bufferline, Statuscolumn with [Heirline](https://github.com/rebelot/heirline.nvim)

### Intuitive

- Auto remove trailing whitespace when save.
- Format code on save with [Conform](https://github.com/stevearc/conform.nvim).
- Some Emacs keyboard shortcuts if you come from Emacs.
- On save, create the missed directories if you forgot to do it yourself.

## 🧰 Installation

    git clone https://github.com/szorfein/svie ~/.config/nvim

## 🔧 Configuration

Add a colorscheme (e.g mocha from [catppuccin.nvim](https://github.com/catppuccin/nvim) or create one):

    curl -o ~/.config/nvim/lua/colors.lua -sSL https://github.com/catppuccin/nvim/raw/refs/heads/main/lua/catppuccin/palettes/mocha.lua

Add the Heirline configuration for the top bar or a classic bottom:

    curl -o ~/.config/nvim/lua/ui/heirline.lua -sSL https://github.com/szorfein/dotfiles/raw/refs/heads/main/swayfx-themes/vibe/.config/nvim/lua/ui/heirline.lua

You can customize any of theses files to matches with your need.

## 🚀 First start

    nvim

lazy.nvim will install all the stuff for sVIe, just wait a few seconds.

## 🙌 Contributing

- Report issues on any bugs, suggestions, questions.
- Pull Request are welcome, enhancing boot time, refactoring, documentations... If not sure about, post an issue first.

## ⭐ Inspiration

- https://github.com/AstroNvim/AstroNvim
- https://github.com/NvChad/NvChad
- https://github.com/brainfucksec/neovim-lua
- https://github.com/xero/dotfiles/tree/main/neovim
