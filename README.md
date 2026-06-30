# Carbon Vandal — Tema para Omarchy

Tema oscuro para Omarchy, construido sobre la identidad visual **Samuhlo — Carbon Vandal**:

- **Carbon `#0C0011`** como fondo único de pantalla, terminales y superficies.
- **Concrete White `#FAF3F0`** como texto base.
- **Structure Gray `#737373`** para comentarios, invisibles y bordes inactivos.
- **Industrial Yellow `#FFCA40`** como firma de sistema: cursor, foco, búsqueda, borde activo, statusline y warnings.
- **Carbon Superficie `#1E1025`** y **Violeta Muteado `#3A2347`** para superficies elevadas y selección.

La paleta queda resumida abajo; el repositorio publicado funciona como tema Omarchy autónomo.

## Quick path — instalar en Omarchy

### Vía interfaz

1. Copia esta URL: `https://github.com/samuhlo/carbon-vandal`.
2. Pulsa `SUPER + ALT + SPACE`.
3. Click en **Install**.
4. Click en **Style**.
5. Click en **Theme**.
6. Pega el enlace y pulsa **Enter**.

### Vía CLI

```bash
omarchy-theme-install https://github.com/samuhlo/carbon-vandal
```

> Si usas un fork, sustituye la URL por la del fork. Omarchy instalará el tema desde la raíz del repositorio.

## Qué cubre este tema

| Capa | Archivos |
| --- | --- |
| Terminal | `alacritty.toml`, `kitty.conf`, `ghostty.conf` |
| Escritorio / UI | `waybar.css`, `walker.css`, `mako.ini`, `swayosd.css`, `chromium.theme` |
| Compositor / lock | `hyprland.conf`, `hyprlock.conf` |
| Editor | `neovim.lua` (LazyVim + Tokyonight override) |
| Sistema | `btop.theme`, `icons.theme` |

## Colores clave (referencia rápida)

| Rol | Hex |
| --- | --- |
| Fondo (Carbon) | `#0C0011` |
| Superficie elevada | `#1E1025` |
| Selección | `#3A2347` |
| Texto base (Concrete White) | `#FAF3F0` |
| Invisibles / estructura | `#737373` |
| Acento de sistema (Industrial Yellow) | `#FFCA40` |

`#FFCA40` queda reservado a foco, cursor, búsqueda y elementos activos. **No** se usa como color genérico de sintaxis.

## Fondo de pantalla

Este tema **no incluye wallpapers**. La pantalla usa el Carbon `#0C0011` como fondo directo — negro profundo, sin imágenes.

Decisión consciente: el tema sale primero con fondo plano para acelerar la publicación. Los wallpapers propios vendrán en una iteración posterior.

## Notas

- `icons.theme` se mantiene en `Yaru-magenta` por compatibilidad con sistemas que ya lo tengan instalado; cambiar a un nombre inventado podría romper la carga de iconos.
- `neovim.lua` preserva la integración LazyVim + Tokyonight y limita `#FFCA40` a grupos de foco (cursor, búsqueda, picker, lualine activo, warning, borde activo).
- Los assets `logo.png`, `preview.png` y `preview/preview-*.png` siguen siendo placeholders del tema fuente `archwave/`. Se regenerarán en un cambio posterior; no afectan el tema funcional.
