return {
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		opts = {
			style = "moon",
			transparent = false,
			on_colors = function(colors)
				-- Carbon Vandal brand palette override.
				-- Industrial Yellow (#FFCA40) is reserved for system/focus only;
				-- syntax uses orange/purple/green/lime/coral/peach instead.
				-- [BLINDAJE] Cero cian frio y cero azul frio: variantes blue/cyan/teal
				-- se reducen a verde menta (#8EFA8D) y purpura tipo (#B57EDC).
				colors.bg = "#0C0011"
				colors.bg_dark = "#0C0011"
				colors.bg_highlight = "#1E1025"
				colors.bg_statusline = "#0C0011"
				colors.bg_popup = "#1E1025"
				colors.bg_sidebar = "#0C0011"
				colors.bg_float = "#1E1025"
				colors.terminal_black = "#1E1025"
				colors.fg = "#FAF3F0"
				colors.fg_dark = "#B57EDC"
				colors.fg_gutter = "#737373"
				colors.dark3 = "#737373"
				colors.comment = "#6E6288"
				colors.dark5 = "#B57EDC"
				colors.blue = "#B57EDC"
				colors.cyan = "#8EFA8D"
				colors.blue1 = "#8EFA8D"
				colors.blue2 = "#8EFA8D"
				colors.blue5 = "#B57EDC"
				colors.blue6 = "#8EFA8D"
				colors.blue7 = "#8EFA8D"
				colors.magenta = "#FF99C8"
				colors.magenta2 = "#FF99C8"
				colors.purple = "#B57EDC"
				colors.orange = "#F5735A"
				colors.yellow = "#FFCA40"
				colors.green = "#98B405"
				colors.green1 = "#8EFA8D"
				colors.green2 = "#98B405"
				colors.teal = "#8EFA8D"
				colors.red = "#E04C4C"
				colors.red1 = "#E04C4C"
			end,
			on_highlights = function(hl, colors)
				-- [FOCUS] Industrial Yellow is the brand system accent.
				-- Reserved for cursor, search, picker focus, lualine active mode,
				-- active borders and warning diagnostics.
				-- [GUARD] El amarillo nunca decora sintaxis: solo UI/system.
				local focus = "#FFCA40"
				local carbon = "#0C0011"
				local surface = "#1E1025"
				local bg_current = "#170A1F"
				local selection = "#3A2347"
				local win_separator = "#2A1E33"
				local text = "#FAF3F0"
				local punctuation = "#B9B2C4"
				local comment_italic = "#6E6288"
				local property_italic = "#F5735A"

				-- Which-key popup
				hl.WhichKeyNormal = { bg = surface }
				hl.WhichKeyFloat = { bg = surface }
				hl.WhichKeyBorder = { bg = surface, fg = focus }

				-- Statusline
				hl.StatusLine = { bg = surface, fg = text }
				hl.StatusLineNC = { bg = carbon, fg = "#737373" }

				-- Lualine
				hl.lualine_a_normal = { bg = focus, fg = carbon }
				hl.lualine_b_normal = { bg = surface, fg = text }
				hl.lualine_c_normal = { bg = carbon, fg = "#B57EDC" }

				-- [FOCUS] System accent overrides
				hl.Cursor = { fg = focus, bg = carbon }
				hl.CurSearch = { fg = carbon, bg = focus }
				hl.Search = { fg = focus, bg = surface }
				hl.IncSearch = { fg = carbon, bg = focus }
				hl.CursorLineNr = { fg = focus, bg = surface }
				hl.DiagnosticWarn = { fg = focus, bg = carbon }
				hl.MatchParen = { fg = focus, bg = carbon }
				-- [LAYOUT] CursorLine y separadores en carbon elevado, no en amarillo.
				hl.CursorLine = { bg = bg_current }
				hl.WinSeparator = { fg = win_separator }
				hl.Visual = { bg = selection }

				-- [DATA] Capturas Treesitter segun theme-specs.md.
				-- Comentario en cursiva tenue; propiedad/param en cursiva melocoton;
				-- puntuacion en gris tenue; el amarillo queda fuera de la sintaxis.
				hl.Comment = { fg = comment_italic, italic = true }
				hl["@comment"] = { fg = comment_italic, italic = true }
				hl["@punctuation"] = { fg = punctuation }
				hl["@punctuation.delimiter"] = { fg = punctuation }
				hl["@punctuation.bracket"] = { fg = punctuation }
				hl["@punctuation.special"] = { fg = punctuation }
				hl["@property"] = { fg = property_italic, italic = true }
				hl["@variable.parameter"] = { fg = property_italic, italic = true }
				hl["@variable.member"] = { fg = property_italic, italic = true }
				hl["@field"] = { fg = property_italic, italic = true }
			end,
		},
		config = function(_, opts)
			require("tokyonight").setup(opts)
			vim.cmd("colorscheme tokyonight-moon")
			-- Snacks picker background locked to Carbon.
			local bg = "#0C0011"
			vim.api.nvim_set_hl(0, "SnacksPicker", { bg = bg })
			vim.api.nvim_set_hl(0, "SnacksPickerList", { bg = bg })
			vim.api.nvim_set_hl(0, "SnacksPickerPreview", { bg = bg })
			vim.api.nvim_set_hl(0, "SnacksPickerPrompt", { bg = bg })
		end,
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "tokyonight-moon",
		},
	},
}