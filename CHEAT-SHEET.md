# VIe cheat sheet

VIe implements some Emacs keyboard shortcut, (not all).

I keep the Vi logic like the navigation with h,j,k,l so for example this change all Emacs shortcuts using the arrow keys with the key for Vi, same with '$' character for 'end line' instead of 'e'.

Also running 'M-x' to run command has no interest here, Vi use ':' instead.

## Indexes

- [Basic Movements](#basics-movements)
- [Windows Management](#windows-management)
- [Navigation keys](#navigation_keys)
- [Taking Notes](#notes-on-c-c)

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

VIe use:

| key | binding | purpose                   |
| --- | ------- | ------------------------- |
| C-x | 0       | deletes the active window |
| C-x | 1       | deletes other windows     |
| C-x | 2       | split window bellow       |
| C-x | 3       | split window right        |
| S   | h,j,k,l | go in cardinal            |

## Navigation keys

Emacs use:

| key          | binding | purpose                                             |
| ------------ | ------- | --------------------------------------------------- |
| <left>,...   |         | Arrow keys move by character in all four directions |
| C-<left>,... |         | Arrow keys move by word in all four directions      |
| <insert>     |         | Activates overwrite more                            |
| C-a          |         | Move point to the begin of the line                 |
| C-e          |         | Move point to the end of the line                   |
| M-f          |         | Move forward by word                                |
| M-b          |         | Move backward by word                               |
| M-}          |         | Move forward to end of paragraph                    |
| M-{          |         | Move forward to start of paragraph                  |
| M-<          |         | Move beginning of the buffer                        |
| M->          |         | Move end of the buffer                              |

Vie use mainly the Vi style:

| key     | binding | purpose                                  |
| ------- | ------- | ---------------------------------------- |
| h,j,k,l |         | Move by character in all four directions |
| R       |         | Activates overwrite more                 |
| 0       |         | Move point to the begin of the line      |
| $       |         | Move point to the end of the line        |
| M-l     |         | Move forward by word                     |
| M-h     |         | Move backward by word                    |
| }       |         | Move forward to end of paragraph         |
| {       |         | Move forward to start of paragraph       |
| gg      |         | Move beginning of the buffer             |
| G       |         | Move end of the buffer                   |

## Notes on [C-c]

sVIe use [vim zettel](https://github.com/michal-h21/vim-zettel)

| key | binding | purpose    |
| --- | ------- | ---------- |
| C-c | nn      | New note   |
| C-c | nf      | Find notes |

## Links

- Vi Cheat Sheet: https://vim.rtorr.com/
