<div align="center">
  <br />
  <h1><code>./CARBON_VANDAL.sh</code></h1>

**ONE SURFACE. ONE ACCENT. ZERO NOISE.**
<br />

[![Repo](https://img.shields.io/badge/REPO-samuhlo%2Fcarbon--vandal-FFCA40?style=for-the-badge&logo=github&logoColor=black)](https://github.com/samuhlo/carbon-vandal)
[![Type](https://img.shields.io/badge/TYPE-OMARCHY_THEME-0C0011?style=for-the-badge&logoColor=FFCA40)](https://github.com/samuhlo/carbon-vandal)
![Coverage](https://img.shields.io/badge/COVERAGE-FULL_DESKTOP-737373?style=for-the-badge)

  <br />
</div>

___

## // 00_ THE_MISSION

**Carbon Vandal** is a dark Omarchy theme. One surface — `Carbon #0C0011` —, one accent — `Industrial Yellow #FFCA40` —, and the text in `Concrete White #FAF3F0`. Terminals, bar, compositor, notifications, editor and system panel share the same palette, so the desktop reads like one piece, not a patch per app.

The theme ships this way to land faster: few decisions, executed with discipline. The rest arrives in later iterations.

> _note: when everything is the same color, the only signal that can mark focus is the accent. That is why `#FFCA40` does not decorate syntax — it is reserved. Any other use breaks the rule of the theme._

___

## // 01_ INSTALL

Omarchy installs the theme from the **repository root**. One URL, one command.

```bash
omarchy-theme-install https://github.com/samuhlo/carbon-vandal
```

If you work from a fork, swap the URL. The folder structure must stay exactly as it is — Omarchy reads the files directly from the root.

To do it from the UI:

1. Press `SUPER + ALT + SPACE`.
2. **Install** → **Style** → **Theme**.
3. Paste `https://github.com/samuhlo/carbon-vandal` and confirm with **Enter**.

___

## // 02_ THE_BLUEPRINT

| LAYER                | TECH                                                            | IMPLEMENTATION DETAIL                                                                 |
| :------------------- | :-------------------------------------------------------------- | :------------------------------------------------------------------------------------ |
| **Terminal**         | `alacritty.toml`, `kitty.conf`, `ghostty.conf`                  | Base palette only; no per-app overrides.                                              |
| **Desktop / UI**     | `waybar.css`, `walker.css`, `mako.ini`, `swayosd.css`, `chromium.theme` | Flat Carbon background, single-accent highlights.                              |
| **Compositor / Lock**| `hyprland.conf`, `hyprlock.conf`                                | Carbon fills, Industrial Yellow on the focus ring.                                    |
| **Editor**           | `neovim.lua`                                                    | LazyVim + Tokyonight override: palette only, `#FFCA40` reserved for focus groups.     |
| **System**           | `btop.theme`, `icons.theme`                                     | `btop` recoloured to the palette; `icons.theme` stays `Yaru-magenta` for compatibility. |

LazyVim and Tokyonight are **preserved**: the override only applies the palette and limits `#FFCA40` to focus groups — cursor, search, picker, lualine in active mode, warnings, active border.

`icons.theme` points to `Yaru-magenta` for compatibility: renaming it to a fabricated theme can leave the bar without icons on systems that already load Yaru.

> _note: LazyVim ships Tokyonight. Instead of replacing it, the override paints over its palette. Same plugin graph, fewer surprises._

___

## // 03_ PALETTE_PROTOCOL

| ROLE                                  | HEX         | FUNCTION                                            |
| :------------------------------------ | :---------- | :-------------------------------------------------- |
| Background (Carbon)                   | `#0C0011`   | Screen, terminals, base surfaces.                   |
| Elevated surface (Carbon Surface)     | `#1E1025`   | Floating panels, popovers.                          |
| Selection                             | `#FFCA40`   | Active highlight, text selection, terminal selection. |
| Base text (Concrete White)            | `#FAF3F0`   | All visible text.                                   |
| Invisibles / structure (Structure Gray)| `#737373`  | Comments, inactive dividers.                        |
| System accent (Industrial Yellow)     | `#FFCA40`   | Cursor, focus, search, active border, warnings.     |

> _note: `#FFCA40` is not a syntax color. Its job is to **signal focus**. If you see it decorating anything else, it is misapplied._

> _note: terminal ANSI green and ANSI blue slots in `alacritty.toml`, `kitty.conf` and `ghostty.conf` are intentionally remapped to `#FFCA40`. Omarchy startup logos, tmux selectors and several terminal UIs render focus through ANSI green/blue, so leaving those slots at the original olive/muted-purple hex makes the logo and selectors read green or purple instead of yellow. The bias is deliberate and limited to terminal palettes — desktop UI keeps the standard role separation._

___

## // 04_ EMPTY_ZONES

These are **not** here, on purpose:

- **Logo and previews are placeholders.** `logo.png`, `preview.png`, and `preview/preview-*.png` are placeholders inherited from the source theme `archwave/`. They help visualize the repo tree, **not** the final look. They will be regenerated in a later change; they do not affect the functional theme.
- **Real screenshots.** They arrive with the first visual validation round, when there is a desktop running the theme.

___

## // 05_ WALLPAPERS

The theme ships four wallpapers under `backgrounds/`:

- `1-prior-art.png` — cassette patent drawing, high-contrast line art with a warm yellow spine.
- `2-bunny-delay.png` — rabbit / audio-effect sketch, sparse strokes on a soft surface.
- `3-sea-rocks.png` — desaturated coastline, dark basalt against a pale, storm-washed sea.
- `4-fog-mountain.png` — pine ridge dissolving into fog, high-contrast monochrome.

Omarchy picks them up automatically from the theme root. Cycle them with `omarchy theme bg next` or the background selector at `SUPER + ALT + SPACE` → **Style** → **Background**.

> _note: filenames are numbered so cycling follows a fixed order, not whatever order the filesystem happens to return._

___

## // 06_ COMPANION_TOOLS

Want more than the four shipped wallpapers? **[omarchy-walls](https://github.com/samuhlo/omarchy-walls)** is a companion tool built in the same voice: a terminal wallpaper browser that streams 1,637 curated images into a floating window, live-previews them, and drops any pick straight into your active theme — no 3.7 GB clone required.

```bash
# browse and install wallpapers without leaving the terminal
omarchy-walls
```

It is a **separate, optional tool** — Carbon Vandal works fully on its own. Pair them if you want a deeper wallpaper rotation.

___

<div align="center">
<br />

<code>DESIGNED & CODED BY <a href='https://github.com/samuhlo'>samuhlo</a></code>

<small>Lugo, Galicia</small>

  <br />
</div>