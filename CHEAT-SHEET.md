# sVIe cheat sheet

sVIe implements some Emacs keyboard shortcut, (not all).

I keep the Vi logic like the navigation with h,j,l,m so for example this change all Emacs shortcuts using the arrow keys with the key for Vi, same with '$' character for 'end line' instead of 'e'.

Also running 'M-x' to run command has no interest here, Vi use ':' instead.

## Indexes

- [Basic Movements](https://github.com/szorfein/nvie/blob/main/KEYBINDS.md#basics-movements)
- [Windows Management](https://github.com/szorfein/nvie/blob/main/KEYBINDS.md#windows-management)
- [Taking Notes](https://github.com/szorfein/svie/blob/main/KEYBINDS.md#notes-on-c-c)

## Basic movements

Emacs use:

| key  | binding | purpose                  |
| ---- | ------- | ------------------------ |
| C-x  | C-f     | find (open) a file       |
| C-x  | C-s     | save the buffer          |
| C-x  | b       | switch buffer            |
| C-x  | k       | kill (close) a buffer    |
| C-x  | C-b     | display all open buffers |
| C-x  | C-c     | exits Emacs              |
| C-\  |         | undo                     |

sVIe use:

| key | binding | purpose                  |
| --- | ------- | ------------------------ |
| C-x | C-f     | find (open) a file       |
| C-x | C-s     | save the buffer          |
| C-x | b       | display all open buffers |
| C-x | k       | kill (close) a buffer    |
| C-x | C-c     | exits sVIe               |
| u   |         | undo                     |

## Windows Management

Emacs use:

| key | binding | purpose                   |
| --- | ------- | ------------------------- |
| C-x | 0       | deletes the active window |
| C-x | 1       | deletes other windows     |
| C-x | 2       | split window bellow       |
| C-x | 3       | split window right        |
| C-x | o       | switch active window      |

sVIe use:

| key | binding | purpose                   |
| --- | ------- | ------------------------- |
| C-x | 0       | deletes the active window |
| C-x | 1       | deletes other windows     |
| C-x | 2       | split window bellow       |
| C-x | 3       | split window right        |
| S   | j,k,l,m | go in cardinal            |

## Notes on [C-c]

sVIe use [vim zettel](https://github.com/michal-h21/vim-zettel)

| key | binding | purpose    |
| --- | ------- | ---------- |
| C-c | nn      | New note   |
| C-c | nf      | Find notes |

## Links

- Vi Cheat Sheet: https://vim.rtorr.com/
