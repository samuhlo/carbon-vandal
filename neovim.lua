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

				-- [DATA] Capturas Treesitter y grupos legacy forzados segun theme-specs.md.
				-- [GUARD] Amarillo (#FFCA40) reservado a UI/system; nunca a sintaxis.
				-- Helper local: aplica la misma spec a varios grupos en una sola linea.
				local function set(groups, spec)
					for _, g in ipairs(groups) do
						hl[g] = spec
					end
				end

				-- Paleta de sintaxis (reutilizada en cada set).
				local pink = "#FF99C8"
				local green = "#8EFA8D"
				local purple = "#B57EDC"
				local olive = "#98B405"
				local lime = "#C8FF36"
				local prop = { fg = property_italic, italic = true }
				local comment = { fg = comment_italic, italic = true }
				local variable = { fg = text }
				local punct = { fg = punctuation }

				-- Keyword / control: rosa marca.
				set({
					"@keyword", "@keyword.return", "@keyword.function",
					"@keyword.conditional", "@keyword.repeat", "@keyword.exception",
					"@keyword.operator", "@keyword.import", "@keyword.coroutine",
					"@conditional", "@repeat", "@exception", "@operator",
					"Keyword", "Conditional", "Repeat", "Exception", "Operator",
				}, { fg = pink })

				-- Function / call / method / constructor: verde menta.
				set({
					"@function", "@function.call", "@function.method",
					"@function.method.call", "@function.builtin",
					"@method", "@method.call", "@constructor",
					"Function",
				}, { fg = green })

				-- Type / class / interface / enum: purpura tipo.
				set({
					"@type", "@type.builtin", "@type.definition", "@type.qualifier",
					"@lsp.type.class", "@lsp.type.interface", "@lsp.type.enum",
					"Type", "Structure", "Typedef",
				}, { fg = purple })

				-- String / char: verde oliva.
				set({
					"@string", "@string.special", "@string.regex", "@string.escape",
					"@character",
					"String", "Character",
				}, { fg = olive })

				-- Number / bool / float / constant: lima.
				set({
					"@number", "@boolean", "@float", "@constant", "@constant.builtin",
					"Number", "Boolean", "Float", "Constant",
				}, { fg = lime })

				-- Property / field / param: melon italic.
				set({
					"@property", "@variable.member", "@field", "@variable.parameter",
					"@lsp.type.property", "@lsp.type.parameter",
				}, prop)

				-- Variable: blanco base + equivalente LSP util.
				set({ "@variable", "@lsp.type.variable" }, variable)

				-- Comment: tenue italic.
				set({ "@comment", "Comment" }, comment)

				-- Punctuation: gris tenue.
				set({
					"@punctuation", "@punctuation.delimiter", "@punctuation.bracket",
					"@punctuation.special",
				}, punct)

				-- Identifier base: blanco, evita que fg_dark residual pinte identificadores legacy.
				hl.Identifier = { fg = text }
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