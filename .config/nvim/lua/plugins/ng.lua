-- [[ Angular plugins ]]
-- https://github.com/joeveiga/ng.nvim

---@type LazyPluginSpec[]
return {
	{
		"joeveiga/ng.nvim",
		keys = {
			{
				"<leader>at",
				function()
					require("ng").goto_template_for_component({ reuse_window = true })
				end,
				{ desc = "[A]ngular goto [t]emplate", noremap = true, silent = true },
			},
			{
				"<leader>ac",
				function()
					require("ng").goto_component_with_template_file({ reuse_window = true })
				end,
				{ desc = "[A]ngular goto [c]omponent", noremap = true, silent = true },
			},
		},
	},
	{
		"Equilibris/nx.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		opts = {
			-- See below for config options
			nx_cmd_root = "npx nx",
		},
		-- Plugin will load when you use these keys
		keys = {
			{ "<leader>nx", "<cmd>Telescope nx actions<CR>", desc = "nx actions" },
		},
	},
}
