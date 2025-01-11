-- [[ Experimental plugin for better ui skin of cmd, notifications ]]
-- https://github.com/folke/noice.nvim

---@type LazyPluginSpec
return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		routes = {
			{
				filter = {
					event = "msg_show",
					any = {
						{ find = "%d+L, %d+B" },
						{ find = "; after #%d+" },
						{ find = "; before #%d+" },
					},
				},
				view = "mini",
			},
		},
		presets = {
			bottom_search = true,
			command_palette = true,
			long_message_to_split = true,
		},
	},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		"rcarriga/nvim-notify",
	},
	config = function(_, opts)
		-- HACK: noice shows messages from before it was enabled,
		-- but this is not ideal when Lazy is installing plugins,
		-- so clear the messages in this case.
		if vim.o.filetype == "lazy" then
			vim.cmd([[messages clear]])
		end
		require("noice").setup(opts)
		vim.keymap.set("n", "<leader>sn", "", { desc = "noice", noremap = true, silent = true })
		vim.keymap.set("c", "<S-Enter>", function()
			require("noice").redirect(vim.fn.getcmdline())
		end, { desc = "Redirect Cmdline" })
		vim.keymap.set("n", "<leader>snl", function()
			require("noice").cmd("last")
		end, { desc = "Noice Last Message" })
		vim.keymap.set("n", "<leader>snh", function()
			require("noice").cmd("history")
		end, { desc = "Noice History" })
		vim.keymap.set("n", "<leader>sna", function()
			require("noice").cmd("all")
		end, { desc = "Noice All" })
		vim.keymap.set("n", "<leader>snd", function()
			require("noice").cmd("dismiss")
		end, { desc = "Dismiss All" })
		vim.keymap.set("n", "<leader>snt", function()
			require("noice").cmd("pick")
		end, { desc = "Noice Picker (Telescope/FzfLua)" })
		vim.keymap.set({ "i", "n", "s" }, "<c-f>", function()
			if not require("noice.lsp").scroll(4) then
				return "<c-f>"
			end
		end, { silent = true, expr = true, desc = "Scroll Forward" })
		vim.keymap.set({ "i", "n", "s" }, "<c-b>", function()
			if not require("noice.lsp").scroll(-4) then
				return "<c-b>"
			end
		end, { silent = true, expr = true, desc = "Scroll Backward" })
	end,
}
