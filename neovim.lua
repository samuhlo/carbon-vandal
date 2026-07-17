return {
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		opts = {
			style = "moon",
			transparent = false,
			on_colors = function(colors)
				-- Carbon Vandal brand palette override.
				-- Industrial Yellow (#FFCA40) is the system/focus accent AND
				-- paints function/call/method/constructor syntax (an explicit
				-- exception); every other syntax role uses pink, purple, lime,
				-- soft lime, or pastel mango instead.
				-- No cold cyan and no cold blue: every blue/cyan/teal variant
				-- below is redirected to mint green (#8EFA8D) or type purple
				-- (#B57EDC).
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
				-- Industrial Yellow is the brand system accent, reserved for
				-- cursor, search, picker focus, lualine's active mode, active
				-- borders, and warning diagnostics — never for syntax roles
				-- other than the function/call/method/constructor exception
				-- below (never strings, keywords, types, or constants/numbers).
				local focus = "#FFCA40"
				local carbon = "#0C0011"
				local surface = "#1E1025"
				local bg_current = "#170A1F"
				local selection = "#3A2347"
				local win_separator = "#2A1E33"
				local text = "#FAF3F0"
				local punctuation = "#B9B2C4"
				local comment_italic = "#6E6288"
				local property_italic = "#D99A6C"

				-- Which-key popup
				hl.WhichKeyNormal = { bg = surface }
				hl.WhichKeyFloat = { bg = surface }
				hl.WhichKeyBorder = { bg = surface, fg = focus }

				-- Statusline
				hl.StatusLine = { bg = surface, fg = text }
				hl.StatusLineNC = { bg = carbon, fg = "#737373" }

				-- Floating windows (file explorer, pickers, LSP hover, WhichKey):
				-- a floating panel is inherently "in focus" while open, so its
				-- border carries the accent instead of tokyonight's stock blue.
				hl.FloatBorder = { fg = focus, bg = surface }

				-- MiniIcons: tokyonight routes "Azure" through its raw `info`
				-- color (a cold blue never touched by on_colors) and "Yellow"
				-- straight through the system accent, which would leak the
				-- focus color onto ordinary file-type icons. Both get pulled
				-- back into the palette: Azure to type purple, Yellow to the
				-- pastel mango already used for properties.
				hl.MiniIconsAzure = { fg = purple }
				hl.MiniIconsYellow = { fg = property_italic }

				-- Bufferline's selected-buffer indicator and every git
				-- change/add/delete surface (signs, diff, diagnostics) are
				-- pinned to the roles theme-specs.md already documents:
				-- change = accent, add = mint green, delete = error red.
				hl.BufferLineIndicatorSelected = { fg = focus }
				hl.GitSignsChange = { fg = focus }
				hl.DiffChange = { fg = focus, bg = carbon }
				hl.GitSignsAdd = { fg = "#8EFA8D" }
				hl.DiffAdd = { fg = "#8EFA8D" }
				hl.GitSignsDelete = { fg = "#E04C4C" }
				hl.DiffDelete = { fg = "#E04C4C" }
				hl.DiagnosticError = { fg = "#E04C4C" }
				hl.DiagnosticInfo = { fg = purple }
				hl.DiagnosticHint = { fg = "#737373" }
				hl.DiagnosticOk = { fg = "#8EFA8D" }

				-- Snacks dashboard (the LAZYVIM splash screen): the header and
				-- footer stat numbers get the brand accent since this is a
				-- chrome surface, not syntax-highlighted code; item
				-- descriptions and icons stay neutral text so the accent
				-- keeps reading as a single hero moment, not decoration.
				hl.SnacksDashboardHeader = { fg = focus }
				hl.SnacksDashboardTitle = { fg = focus }
				hl.SnacksDashboardSpecial = { fg = focus }
				hl.SnacksDashboardFooter = { fg = "#737373" }
				hl.SnacksDashboardDesc = { fg = text }
				hl.SnacksDashboardIcon = { fg = focus }

				-- System accent: the surfaces where focus is signaled.
				hl.Cursor = { fg = focus, bg = carbon }
				hl.CurSearch = { fg = carbon, bg = focus }
				hl.Search = { fg = focus, bg = surface }
				hl.IncSearch = { fg = carbon, bg = focus }
				hl.CursorLineNr = { fg = focus, bg = surface }
				hl.DiagnosticWarn = { fg = focus, bg = carbon }
				hl.MatchParen = { fg = focus, bg = carbon }
				-- Cursor line and separators stay on elevated Carbon, not yellow —
				-- the accent marks focus, not layout.
				hl.CursorLine = { bg = bg_current }
				hl.WinSeparator = { fg = win_separator }
				hl.Visual = { bg = selection }

				-- Treesitter captures and legacy highlight groups, forced to the
				-- roles defined in theme-specs.md. Yellow (#FFCA40) lives in
				-- UI/system chrome plus function/call/method/constructor syntax;
				-- it never appears in strings, keywords, types, or
				-- constants/numbers.
				-- Local helper: apply the same spec to several groups at once.
				local function set(groups, spec)
					for _, g in ipairs(groups) do
						hl[g] = spec
					end
				end

				-- Syntax palette, reused by each set() call below.
				local pink = "#FF99C8"
				local function_color = "#FFCA40"
				local purple = "#B57EDC"
				local string_color = "#D4D97A"
				local number_color = "#C8FF36"
				local prop = { fg = property_italic, italic = true }
				local comment = { fg = comment_italic, italic = true }
				local variable = { fg = text }
				local punct = { fg = punctuation }

				-- Keyword / control flow: brand pink.
				set({
					"@keyword", "@keyword.return", "@keyword.function",
					"@keyword.conditional", "@keyword.repeat", "@keyword.exception",
					"@keyword.operator", "@keyword.import", "@keyword.coroutine",
					"@conditional", "@repeat", "@exception", "@operator",
					"Keyword", "Conditional", "Repeat", "Exception", "Operator",
				}, { fg = pink })

				-- Function / call / method / constructor: brand yellow
				-- (the explicit exception — yellow also paints syntax here).
				set({
					"@function", "@function.call", "@function.method",
					"@function.method.call", "@function.builtin",
					"@method", "@method.call", "@constructor",
					"Function",
				}, { fg = function_color })

				-- Type / class / interface / enum: type purple.
				set({
					"@type", "@type.builtin", "@type.definition", "@type.qualifier",
					"@lsp.type.class", "@lsp.type.interface", "@lsp.type.enum",
					"Type", "Structure", "Typedef",
				}, { fg = purple })

				-- String / char: soft lime.
				set({
					"@string", "@string.special", "@string.regex", "@string.escape",
					"@character",
					"String", "Character",
				}, { fg = string_color })

				-- Number / bool / float / constant: lime.
				set({
					"@number", "@boolean", "@float", "@constant", "@constant.builtin",
					"Number", "Boolean", "Float", "Constant",
				}, { fg = number_color })

				-- Property / field / param: pastel mango, italic.
				set({
					"@property", "@variable.member", "@field", "@variable.parameter",
					"@lsp.type.property", "@lsp.type.parameter",
				}, prop)

				-- Variable: base text color, plus the LSP-semantic equivalent.
				set({ "@variable", "@lsp.type.variable" }, variable)

				-- Comment: muted italic.
				set({ "@comment", "Comment" }, comment)

				-- Punctuation: dim gray.
				set({
					"@punctuation", "@punctuation.delimiter", "@punctuation.bracket",
					"@punctuation.special",
				}, punct)

				-- Base Identifier group, so a residual fg_dark doesn't leak
				-- through onto legacy (non-Treesitter) identifiers.
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

			-- mini.icons ships its own `ColorScheme` autocmd that re-links
			-- MiniIconsAzure/MiniIconsYellow (to Function/DiagnosticWarn) on
			-- every colorscheme event, which can fire after — and so win
			-- over — the on_highlights override above. Re-assert on the
			-- next tick, after every other ColorScheme callback (including
			-- mini.icons') has already run, so ours always has the last word.
			vim.api.nvim_create_autocmd("ColorScheme", {
				callback = function()
					vim.schedule(function()
						vim.api.nvim_set_hl(0, "MiniIconsAzure", { fg = "#B57EDC" })
						vim.api.nvim_set_hl(0, "MiniIconsYellow", { fg = "#D99A6C" })
					end)
				end,
			})
		end,
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "tokyonight-moon",
		},
	},
	{
		-- Lualine builds its mode colors from its own internal call to
		-- tokyonight's raw palette (bypassing on_colors/on_highlights
		-- entirely), so the mode indicator has to be set here directly
		-- instead of through highlight groups. Each mode keeps a distinct,
		-- already-established Carbon Vandal role instead of introducing new
		-- hues: Normal is the resting/focus state and gets the accent;
		-- other modes borrow from the existing syntax palette.
		"nvim-lualine/lualine.nvim",
		opts = function(_, opts)
			local carbon = "#0C0011"
			local surface = "#1E1025"
			local structure = "#737373"

			local function mode(bg)
				return {
					a = { bg = bg, fg = carbon, gui = "bold" },
					b = { bg = surface, fg = bg },
				}
			end

			opts.options.theme = {
				normal = {
					a = { bg = "#FFCA40", fg = carbon, gui = "bold" }, -- accent: resting state
					b = { bg = surface, fg = "#FAF3F0" },
					c = { bg = carbon, fg = "#FAF3F0" },
				},
				insert = mode("#8EFA8D"), -- mint green: adding
				visual = mode("#FF99C8"), -- keyword pink: selecting
				replace = mode("#E04C4C"), -- error red: overwriting
				command = mode("#B57EDC"), -- type purple: directing
				terminal = mode("#C8FF36"), -- lime: shelled out
				inactive = {
					a = { bg = surface, fg = structure },
					b = { bg = surface, fg = structure },
					c = { bg = carbon, fg = structure },
				},
			}
		end,
	},
}
