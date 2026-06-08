# Changelog

## 0.33.0 - Jun. 2026

Perf enhancements

- Improve the loading time (-10ms).
- Remove the input delay on scrolling (j|k).
- Colorizer use a fork "wochap/nvim-highlight-colors", this remove freeze when scrolling.
- Use "prettierd" instead of prettier on Conform

Neovim LSP

- JS: Enable oxlint [oxc](https://oxc.rs/) (used in last vue.js project (npm create vue@latest))

## 0.29.0, Apr. 2026

- Don't format Ansible code, just enable lsp
- Whichkey with `preset=modern`
- Autocmd for resize windows
- Enable LSP for yaml

## 0.25.0 - Mar. 2026

- New keybinds for split, move and resize windows.
- Catppuccin.nvim: disable all integrations by default.
- Add syntax highlight on Yuck.
- Snack.indent: new color and character.
- Rename project VIe, pronounce 'Vee', mean Life in french.
- Rename KEYBINDS.md CHEAT-SHEET.md, add a paragraph about basic movements.

## 0.20.0 - Feb. 2026

- Add KEYBINDS.md to list all the shortcuts.
- Improve a bit the 'blink.cmp' definition.
- Add Keybind shortcut 'Windows management' from Emacs.
- Autocmd: create missing directory on save.
