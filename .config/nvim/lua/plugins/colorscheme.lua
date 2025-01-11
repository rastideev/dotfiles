-- [[ Plugins that define the colorscheme of neovim ]]

---@type LazyPluginSpec[]
return {
	{
		"xiyaowong/transparent.nvim",
		opts = {
			-- table: default groups
			groups = {
				"Normal",
				"NormalNC",
				"Comment",
				"Constant",
				"Special",
				"Identifier",
				"Statement",
				"PreProc",
				"Type",
				"Underlined",
				"Todo",
				"String",
				"Function",
				"Conditional",
				"Repeat",
				"Operator",
				"Structure",
				"LineNr",
				"NonText",
				"SignColumn",
				"CursorLine",
				"CursorLineNr",
				"StatusLine",
				"StatusLineNC",
				"EndOfBuffer",
			},
			-- table: additional groups that should be cleared
			extra_groups = {
				-- "NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
				"NvimTreeNormal", -- NvimTree
			},
			-- table: groups you don't want to clear
			exclude_groups = {},
			-- function: code to be executed after highlight groups are cleared
			-- Also the user event "TransparentClear" will be triggered
			on_clear = function() end,
		},
	},
	{
		-- Theme inspired by Atom
		"navarasu/onedark.nvim",
		keys = {
			{ "<leader>sc" },
		},
		name = "onedark",
	},
	{
		"rose-pine/neovim",
		keys = {
			{ "<leader>sc" },
		},
		name = "rose-pine",
	},
	{
		"folke/tokyonight.nvim",
		keys = {
			{ "<leader>sc" },
		},
		name = "tokyonight",
		opts = { style = "moon" },
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		---@type CatppuccinOptions
		opts = {
			flavour = "macchiato",
			default_integrations = true,
			integrations = {
				cmp = true,
				blink_cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				notify = false,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
				harpoon = true,
				fidget = true,
				indent_blankline = {
					enabled = true,
					scope_color = "flamingo", -- catppuccin color (eg. `lavender`) Default: text
					colored_indent_levels = false,
				},
				dap = true,
				dap_ui = true,
				render_markdown = true,
			},
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
