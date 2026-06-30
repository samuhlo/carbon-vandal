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
				colors.bg = "#0C0011"
				colors.bg_dark = "#0C0011"
				colors.bg_highlight = "#1E1025"
				colors.bg_statusline = "#0C0011"
				colors.bg_popup = "#1E1025"
				colors.bg_sidebar = "#0C0011"
				colors.bg_float = "#1E1025"
				colors.terminal_black = "#1E1025"
				colors.fg = "#FAF3F0"
				colors.fg_dark = "#C9A6E8"
				colors.fg_gutter = "#737373"
				colors.dark3 = "#737373"
				colors.comment = "#737373"
				colors.dark5 = "#C9A6E8"
				colors.blue = "#B57EDC"
				colors.cyan = "#2EC4D6"
				colors.blue1 = "#2EC4D6"
				colors.blue2 = "#5FE0E8"
				colors.blue5 = "#C9A6E8"
				colors.blue6 = "#5FE0E8"
				colors.blue7 = "#2EC4D6"
				colors.magenta = "#FF6D6E"
				colors.magenta2 = "#FF99C8"
				colors.purple = "#B57EDC"
				colors.orange = "#FFA64A"
				colors.yellow = "#FFCA40"
				colors.green = "#98B405"
				colors.green1 = "#8EFA8D"
				colors.green2 = "#98B405"
				colors.teal = "#2EC4D6"
				colors.red = "#E04C4C"
				colors.red1 = "#E04C4C"
			end,
			on_highlights = function(hl, colors)
				-- [FOCUS] Industrial Yellow is the brand system accent.
				-- Reserved for cursor, search, picker focus, lualine active mode,
				-- active borders and warning diagnostics.
				local focus = "#FFCA40"
				local carbon = "#0C0011"
				local surface = "#1E1025"
				local selection = "#3A2347"
				local text = "#FAF3F0"

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
				hl.lualine_c_normal = { bg = carbon, fg = "#C9A6E8" }

				-- [FOCUS] System accent overrides
				hl.Cursor = { fg = focus, bg = carbon }
				hl.CurSearch = { fg = carbon, bg = focus }
				hl.Search = { fg = focus, bg = surface }
				hl.IncSearch = { fg = carbon, bg = focus }
				hl.CursorLineNr = { fg = focus, bg = surface }
				hl.DiagnosticWarn = { fg = focus, bg = carbon }
				hl.MatchParen = { fg = focus, bg = carbon }
				hl.Visual = { bg = selection }
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