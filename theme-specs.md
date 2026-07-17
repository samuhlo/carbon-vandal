# Carbon Vandal — color spec (LazyVim + shell)

This document is the source of truth for the syntax and shell-highlighting
roles applied across the theme. It is a Dracula-style layout adapted to the
Carbon Vandal brand.

Hard rules: **zero cyan and zero cold blue**, comments and parameters are
*italic* (in the editor), and **yellow lives in UI/system chrome and in
function/call/method/constructor syntax** — an explicit exception. It never
appears in strings, keywords, types, or constants/numbers.

## Palette

| Role                    | Hex       | Notes                    |
| ------------------------ | --------- | ------------------------- |
| bg                       | `#0C0011` | primary background        |
| bg_elevated              | `#1E1025` | floats, panels, pmenu      |
| current line             | `#170A1F` | CursorLine                |
| selection                | `#3A2347` | Visual                    |
| fg                       | `#FAF3F0` | text / variables          |
| comment                  | `#6E6288` | *italic*                  |
| invisibles               | `#737373` | indent, nontext, borders  |
| **system (brand)**       | `#FFCA40` | yellow — UI + function/call/method/constructor |
| keyword                  | `#FF99C8` | pink                      |
| function / call          | `#FFCA40` | yellow (exception)        |
| type                     | `#B57EDC` | purple                    |
| string                   | `#D4D97A` | soft lime                 |
| number / bool / const    | `#C8FF36` | lime                      |
| property / param / flag  | `#D99A6C` | pastel mango, *italic*    |
| punctuation              | `#B9B2C4` | muted                     |
| error                    | `#E04C4C` | coral red                 |
| success                  | `#8EFA8D` | mint green                |

## LazyVim syntax (Treesitter `@` captures)

| Captures                                                                 | Color     | Style  |
| ------------------------------------------------------------------------ | --------- | ------ |
| `@keyword`, `@keyword.*`, `@conditional`, `@repeat`, `@exception`, `@operator` | `#FF99C8` | —      |
| `@function`, `@function.call`, `@function.method`, `@constructor`        | `#FFCA40` | —      |
| `@type`, `@type.builtin`, `@type.definition`, `@lsp.type.class/interface/enum` | `#B57EDC` | —      |
| `@string`, `@string.*`, `@character`                                     | `#D4D97A` | —      |
| `@number`, `@boolean`, `@float`, `@constant`, `@constant.builtin`        | `#C8FF36` | —      |
| `@property`, `@variable.member`, `@field`, `@variable.parameter`         | `#D99A6C` | italic |
| `@variable`                                                              | `#FAF3F0` | —      |
| `@comment`                                                               | `#6E6288` | italic |
| `@punctuation.*`                                                         | `#B9B2C4` | —      |

## LazyVim UI / system (this is where yellow lives)

| Group                        | fg / bg                        |
| ---------------------------- | ------------------------------ |
| `Normal`                     | fg `#FAF3F0` / bg `#0C0011`     |
| `NormalFloat`, `Pmenu`       | fg `#FAF3F0` / bg `#1E1025`     |
| `CursorLine`                 | bg `#170A1F`                   |
| `LineNr`                     | fg `#737373`                   |
| `CursorLineNr`               | fg `#FFCA40` (bold)            |
| `Cursor`, `TermCursor`       | bg `#FFCA40`                   |
| `Visual`                     | bg `#3A2347`                   |
| `Search`, `IncSearch`, `CurSearch` | fg `#0C0011` / bg `#FFCA40` |
| `MatchParen`                 | fg `#FFCA40` (bold)            |
| `PmenuSel`, `TelescopeSelection` | fg `#FFCA40` / bg `#1E1025` |
| `Title`, active branch/mode in statusline | fg `#FFCA40`       |
| `WinSeparator`               | fg `#2A1E33`                   |

## Diagnostics and Git

| Group                                   | Color     |
| --------------------------------------- | --------- |
| `DiagnosticError`, `DiffDelete`, `GitSignsDelete` | `#E04C4C` |
| `DiagnosticWarn`, `DiffChange`, `GitSignsChange`  | `#FFCA40` |
| `DiagnosticInfo`                        | `#B57EDC` |
| `DiagnosticHint`                        | `#737373` |
| `DiagnosticOk`, `DiffAdd`, `GitSignsAdd`| `#8EFA8D` |

## Terminal / shell (the blue in `z`, `gh`, …)

That blue you see highlighting command arguments is **not** Neovim and
**not** the ANSI palette — it's the shell's own syntax highlighting
(fish/zsh), configured separately from the terminal emulator.

| Shell role                   | Color            |
| ----------------------------- | ---------------- |
| command (verb)                | `#8EFA8D` (bold) |
| argument / param (the blue)   | `#FAF3F0`        |
| option / flag (`--x`)         | `#F5735A`        |
| string / quotes               | `#98B405`        |
| operator / redirection        | `#FF99C8`        |
| autosuggestion (ghost text)   | `#6E6288`        |
| error                         | `#E04C4C`        |
| comment                       | `#6E6288`        |

**fish** (`~/.config/fish/config.fish` or a file under `conf.d/`):

```fish
set -g fish_color_command 8EFA8D --bold
set -g fish_color_param FAF3F0
set -g fish_color_option F5735A
set -g fish_color_quote 98B405
set -g fish_color_operator FF99C8
set -g fish_color_redirection FF99C8
set -g fish_color_autosuggestion 6E6288
set -g fish_color_error E04C4C
set -g fish_color_comment 6E6288
set -g fish_color_end FF99C8
```

**zsh** (zsh-syntax-highlighting + zsh-autosuggestions, in `.zshrc` after
the plugins load):

```zsh
ZSH_HIGHLIGHT_STYLES[command]='fg=#8EFA8D,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#8EFA8D,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=#8EFA8D,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#8EFA8D,bold'
ZSH_HIGHLIGHT_STYLES[default]='fg=#FAF3F0'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#F5735A'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#F5735A'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#98B405'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#98B405'
ZSH_HIGHLIGHT_STYLES[comment]='fg=#6E6288'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#E04C4C'
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#6E6288'
```

> Note: fish uses hex codes **without** `#`; zsh uses them **with** `#`.

## Implementation notes

- **LazyVim**: `neovim.lua` in this repo sets these groups with
  `vim.api.nvim_set_hl(0, "<group>", { fg = "#...", bg = "#...", italic = true })`
  (via `tokyonight.nvim`'s `on_colors`/`on_highlights` hooks), applied after
  the base colorscheme loads. No specific base theme is required — the
  hooks paint over whichever colorscheme they're attached to.
- **Shell**: apply the fish or zsh block above depending on the active
  shell (check with `echo $SHELL`). This repo does not ship shell configs
  directly — these snippets are meant to be copied into the user's own
  fish/zsh config.
