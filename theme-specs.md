# Carbon Vándalo — Spec de colores (LazyVim + shell)

Objetivo: aplicar este esquema de color a Neovim (LazyVim) y al resaltado del shell. Estética Dracula adaptada a la marca.
Reglas duras: **cero cian y cero azul frío**, comentarios y parámetros en *cursiva* (en el editor), y el **amarillo vive en UI/sistema y en sintaxis de function/call/method/constructor** (excepción explícita; nunca en strings, keywords, tipos o constantes/números).

## Paleta

| Rol                  | Hex       | Notas              |
| -------------------- | --------- | ------------------ |
| bg                   | `#0C0011` | fondo principal    |
| bg_elevado           | `#1E1025` | floats, panel, pmenu |
| línea_actual         | `#170A1F` | CursorLine         |
| selección            | `#3A2347` | Visual             |
| fg                   | `#FAF3F0` | texto/variables    |
| comentario           | `#6E6288` | *italic*           |
| invisibles           | `#737373` | indent, nontext, bordes |
| **sistema (marca)**  | `#FFCA40` | amarillo, UI + function/call/method/constructor |
| keyword              | `#FF99C8` | rosa               |
| función / comando    | `#FFCA40` | amarillo (excepción) |
| tipo                 | `#B57EDC` | púrpura            |
| string               | `#D4D97A` | lima suave         |
| número/bool/const    | `#C8FF36` | lima               |
| propiedad/param/flag | `#D99A6C` | mango pastel *italic* |
| puntuación           | `#B9B2C4` | tenue              |
| error                | `#E04C4C` | rojo coral         |
| success              | `#8EFA8D` | verde menta        |

## Sintaxis LazyVim (Treesitter `@` captures)

| Captures                                                                 | Color     | Estilo |
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

## UI / Sistema LazyVim (el amarillo vive aquí)

| Grupo                        | fg / bg                        |
| ---------------------------- | ------------------------------ |
| `Normal`                     | fg `#FAF3F0` / bg `#0C0011`     |
| `NormalFloat`, `Pmenu`       | fg `#FAF3F0` / bg `#1E1025`     |
| `CursorLine`                 | bg `#170A1F`                   |
| `LineNr`                     | fg `#737373`                   |
| `CursorLineNr`               | fg `#FFCA40` (bold)            |
| `Cursor`, `TermCursor`       | bg `#FFCA40`                   |
| `Visual`                     | bg `#3A2347`                   |
| `Search`, `IncSearch`, `CurSearch` | fg `#0C0011` / bg `#FFCA40` |
| `MatchParen`                 | fg `#FFCA40` (bold)           |
| `PmenuSel`, `TelescopeSelection` | fg `#FFCA40` / bg `#1E1025` |
| `Title`, branch/modo activo statusline | fg `#FFCA40`         |
| `WinSeparator`               | fg `#2A1E33`                   |

## Diagnósticos y Git

| Grupo                                   | Color     |
| --------------------------------------- | --------- |
| `DiagnosticError`, `DiffDelete`, `GitSignsDelete` | `#E04C4C` |
| `DiagnosticWarn`, `DiffChange`, `GitSignsChange`  | `#FFCA40` |
| `DiagnosticInfo`                        | `#B57EDC` |
| `DiagnosticHint`                        | `#737373` |
| `DiagnosticOk`, `DiffAdd`, `GitSignsAdd`| `#8EFA8D` |

## Terminal / Shell (el azul de `z`, `gh`…)

Ese azul de los argumentos **no es Neovim ni el palette ANSI**: es el resaltado de sintaxis del shell. Se cambia en la config del shell.

| Rol shell                    | Color            |
| ---------------------------- | ---------------- |
| comando (verbo)              | `#8EFA8D` (bold) |
| argumento / param (el azul)  | `#FAF3F0`        |
| opción / flag (`--x`)        | `#F5735A`        |
| string / comillas            | `#98B405`        |
| operador / redirección       | `#FF99C8`        |
| autosuggestion (ghost)       | `#6E6288`        |
| error                        | `#E04C4C`        |
| comentario                   | `#6E6288`        |

**fish** (`~/.config/fish/config.fish` o un archivo en `conf.d/`):

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

**zsh** (zsh-syntax-highlighting + zsh-autosuggestions, en `.zshrc` tras cargar los plugins):

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

> Nota: fish usa el hex **sin** `#`; zsh lo usa **con** `#`.

## Implementación sugerida

- **LazyVim**: archivo Lua que fije los grupos con `vim.api.nvim_set_hl(0, "<grupo>", { fg = "#...", bg = "#...", italic = true })`, cargado tras el colorscheme base (autocmd `ColorScheme` o al final de la config). No hace falta un tema base concreto.
- **Shell**: aplicar el bloque de fish o de zsh según el shell activo (comprobar con `echo $SHELL`).
