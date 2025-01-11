-- https://github.com/nvim-lualine/lualine.nvim
-- Set lualine as statusline

---@type LazyPluginSpec
return {
	-- See `:help lualine.txt`
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	opts = {
		options = {
			icons_enabled = false,
			theme = "catppuccin",
			component_separators = "|",
			section_separators = "",
		},
	},
}
