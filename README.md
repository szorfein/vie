<h1 align=center>VIe</h1>

<p align="center"> <i><b>Vi</b></i> * <i><b>E</b>macs</i> <i>("Vie" means "Life" in French)</i></p>

###

<div align=center>

![GitHub last commit](https://img.shields.io/github/last-commit/szorfein/vie?style=for-the-badge&labelColor=101418&color=9ccbfb)
![GitHub Repo stars](https://img.shields.io/github/stars/szorfein/vie?style=for-the-badge&labelColor=101418&color=b9c8da)
![GitHub repo size](https://img.shields.io/github/repo-size/szorfein/vie?style=for-the-badge&labelColor=101418&color=d3bfe6)

</div>

###

<p align="center" style="padding: 8px 0 16px 0;">
An aesthetic modular <b>Neovim</b> configuration focused on being <b>intuitive</b> and <b>fast</b>.
</p>

|                                                                                                      |                                                                                                             |
| ---------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| ![Vibe theme with Vie Dasboard](https://github.com/szorfein/unix-portfolio/raw/master/Vibe/Neow.jpg) | ![Familiar theme with Vie](https://github.com/szorfein/unix-portfolio/raw/master/SwayFX/Familiar/clean.jpg) |
| ![Jinx theme with Vie](https://github.com/szorfein/unix-portfolio/raw/master/SwayFX/Jinx/full.jpg)   | ![Valyria theme with Vie](https://github.com/szorfein/unix-portfolio/raw/master/SwayFX/Valyria/full.jpg)    |

## ✨ Features

### Aesthetic

- All colors with [Catppuccin](https://github.com/catppuccin/nvim)
- Syntax highlighting with [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- Git integration with [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- Statusline, Winbar, Bufferline and Statuscolumn with [Heirline](https://github.com/rebelot/heirline.nvim)
- Beautiful Markdown with [render-markdown](https://github.com/MeanderingProgrammer/render-markdown.nvim)

### Intuitive

- Fast indentation with [Indent-O-Matic](https://github.com/Darazaki/indent-o-matic)
- Automatically remove trailing whitespace on save.
- Format code on save with [Conform](https://github.com/stevearc/conform.nvim).
- Manage Vim buffers like Emacs `<Ctrl-x><b>`, `<Ctrl-x><Ctrl-f>`, `<Ctrl-x>k`
- On save, create any missing directories if you forgot to do so yourself `:e h/e/l/l/o/world`.
- Take simple notes with [vim-zettel](https://github.com/michal-h21/vim-zettel) using `<Ctrl-c>`

## 🧰 Installation

    git clone https://github.com/szorfein/vie ~/.config/nvim

## 🔧 Configuration

Add a colorscheme (e.g Mocha from [catppuccin.nvim](https://github.com/catppuccin/nvim) or create you own):

    curl -o ~/.config/nvim/lua/colors.lua -sSL https://github.com/catppuccin/nvim/raw/refs/heads/main/lua/catppuccin/palettes/mocha.lua

Add the Heirline configuration for the top, bottom, the both or no bar:

    curl -o ~/.config/nvim/lua/ui/heirline.lua -sSL https://github.com/szorfein/dotfiles/raw/refs/heads/main/swayfx-themes/vibe/.config/nvim/lua/ui/heirline.lua

You can customize any of these files to suit your needs.

## 🚀 First start

    nvim

lazy.nvim will install everything for Vie. Just wait a few seconds.

## Troubleshooting

#### Blink takes too long to compile

Because the default "lazy" timeout is 2 minutes, blink.cmp may not have time to compile. The solution is to compile Blink from a terminal:

    nvim --headless "+Lazy! build blink.cmp" +qa

## 🙌 Contributing

- Report issues, bugs, or suggestions, questions.
- Pull requests are welcome. Contributions that improve boot time, refactor code, or improve the documentation are appreciated. If you're unsure, post an issue first.

## ⭐ Inspiration

- https://github.com/AstroNvim/AstroNvim
- https://github.com/NvChad/NvChad
- https://github.com/brainfucksec/neovim-lua
- https://github.com/xero/dotfiles/tree/main/neovim
- https://github.com/wochap/nvim
- https://www.lazyvim.org/
