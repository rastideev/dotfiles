-- https://github.com/hedyhli/outline.nvim
-- A sidebar with a tree-like outline of symbols from your code, powered by LSP
--
-- There are also some related plugins like `aerial.nvim` found below
-- https://github.com/hedyhli/outline.nvim?tab=readme-ov-file#related-plugins

---@type LazyPluginSpec
return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	keys = {
		{ "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
	},
	opts = {
		symbol_folding = {
			-- Unfold entire symbol tree by default with false, otherwise enter a
			-- number starting from 1
			autofold_depth = false,
			-- autofold_depth = 1,
		},
		outline_window = {
			-- Percentage or integer of columns
			width = 35,
		},
	},
}
