-- [[ Plugin for go development ]]
-- https://github.com/ray-x/go.nvim

---@type LazyPluginSpec
return {
	"ray-x/go.nvim",
	dependencies = { -- optional packages
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
	},
	ft = { "go", "gomod" },
	build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	config = function()
		require("go").setup()

		vim.keymap.set(
			"n",
			"<leader>gsj",
			"<cmd> GoAddTag json <CR>",
			{ desc = "Add json struct tags", noremap = true, silent = true }
		)
		vim.keymap.set(
			"n",
			"<leader>gsy",
			"<cmd> GoAddTag yaml <CR>",
			{ desc = "Add yaml struct tags", noremap = true, silent = true }
		)
		vim.keymap.set(
			"n",
			"<leader>gir",
			"<cmd> GoIfErr <CR>kO",
			{ desc = "Add go error boilerplate", noremap = true, silent = true }
		)

		-- Run gofmt + goimport on save
		local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*.go",
			callback = function()
				require("go.format").goimport()
			end,
			group = format_sync_grp,
		})
	end,
}
