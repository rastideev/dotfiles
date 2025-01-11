-- [[ File tree plugin ]]
-- https://github.com/nvim-tree/nvim-tree.lua

---@type LazyPluginSpec
return {
	"nvim-tree/nvim-tree.lua",
	cmd = { "NvimTreeToggle", "NvimTreeFocus" },
	keys = {
		{ "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" } }, -- toggle file explorer
		{ "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" } }, -- toggle file explorer on current file
		{ "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" } }, -- collapse file explorer
		{ "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" } }, -- refresh file explorer
	},
	opts = {
		filters = {
			dotfiles = false,
			custom = {
				"node_modules/.*",
			},
		},
		disable_netrw = true,
		hijack_netrw = true,
		hijack_cursor = true,
		hijack_unnamed_buffer_when_opening = false,
		sync_root_with_cwd = true,
		update_focused_file = {
			enable = true,
			update_root = false,
		},
		view = {
			adaptive_size = false,
			side = "right",
			width = 40,
			preserve_window_proportions = true,
		},
		git = {
			enable = false,
			ignore = true,
		},
		filesystem_watchers = {
			enable = true,
		},
		actions = {
			open_file = {
				resize_window = true,
				quit_on_open = true,
			},
		},
		renderer = {
			root_folder_label = false,
			highlight_git = false,
			highlight_opened_files = "none",

			indent_markers = {
				enable = false,
			},

			icons = {
				show = {
					file = true,
					folder = true,
					folder_arrow = true,
					git = false,
				},

				glyphs = {
					default = "󰈚",
					symlink = "",
					folder = {
						default = "",
						empty = "",
						empty_open = "",
						open = "",
						symlink = "",
						symlink_open = "",
						arrow_open = "",
						arrow_closed = "",
					},
					git = {
						unstaged = "✗",
						staged = "✓",
						unmerged = "",
						renamed = "➜",
						untracked = "★",
						deleted = "",
						ignored = "◌",
					},
				},
			},
		},
	},
}
