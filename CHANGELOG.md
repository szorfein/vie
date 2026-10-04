# Changelog

## 0.42.0 - Oct.2026

- Rewrite plugins to be more "modular", include LazyVim.nvim
- More lua/plugins/lang-* (astro, vue, go, ruby, markdown, etc...)
- More optimization on startup speed
- Typescript use vtsls (lsp) by default
- Vue.js use oxl by default with vue_ls (not prettier)
- Highlighting chezmoi template with alker0/chezmoi.vim
- Beautiful markdown with MeanderingProgrammer/render-markdown.nvim
- Add trouble.nvim for diagnostic

## 0.34.0 - Sep. 2026

- Add fast indent with "Darazaki/indent-o-matic"

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
