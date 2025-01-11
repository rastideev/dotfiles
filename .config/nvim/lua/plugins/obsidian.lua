-- [[ Plugin to work with Obsidian in neovim ]]
-- https://github.com/epwalsh/obsidian.nvim

local vaultPath = "/mnt/c/Users/lukas/Documents/Vaults/RastisBrain"
-- relative paths to vault
local notesPath = "05 - Fleeting"
local extras = "99 - Extras/"
local templatePath = extras .. "Templates"
local attachmentsPath = extras .. "Attachments"

---@type LazyPluginSpec
return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	-- ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	event = {
		-- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		-- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
		-- refer to `:h file-pattern` for more examples
		-- stylua: ignore
		"BufReadPre " .. vaultPath	.. "/*.md",
		"BufNewFile " .. vaultPath .. "/*.md",
	},
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",

		-- see below for full list of optional dependencies 👇
	},
	init = function()
		-- set the conceallevel to 1 for obsidian to work/render properly
		vim.opt.conceallevel = 1
	end,
	keys = {
		{ "<leader>mn", "<CMD>ObsidianNew<CR>", desc = "Create new Obsidian note." },
		{ "<leader>mr", "<CMD>ObsidianRename<CR>", desc = "Rename Obsidian note." },
		{ "<leader>me", "<CMD>ObsidianExtractNote<CR>", desc = "Extract Obsidian note from highlighted text." },
		{ "<leader>mt", "<CMD>ObsidianTemplate<CR>", desc = "Insert an obsidian template." },
		{ "<leader>mT", "<CMD>ObsidianNewFromTemplate<CR>", desc = "Create new Obsidian note from template." },
		{ "<leader>mq", "<CMD>ObsidianQuickSwitch<CR>", desc = "Quickly switch to other note in vault" },
	},
	opts = {
		workspaces = {
			{
				name = "RastisBrain",
				path = vaultPath,
				overrides = {
					notes_subdir = notesPath,
				},
			},
		},

		-- Where to put new notes. Valid options are
		--  * "current_dir" - put new notes in same directory as the current buffer.
		--  * "notes_subdir" - put new notes in the default notes subdirectory.
		new_notes_location = "notes_subdir",

		-- Optional, customize how note IDs are generated given an optional title.
		---@param title string|?
		---@return string
		note_id_func = function(title)
			-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
			-- In this case a note with the title 'My new note' will be given an ID that looks
			-- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
			local suffix = ""
			if title ~= nil then
				-- If title is given, transform it into valid file name.
				suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
			else
				-- If title is nil, just add 4 random uppercase letters to the suffix.
				for _ = 1, 4 do
					suffix = suffix .. string.char(math.random(65, 90))
				end
			end

			-- The old default way
			-- return tostring(os.time()) .. "-" .. suffix

			return os.date("%Y%d%m%H%M") .. "-" .. suffix
		end,

		-- Optional, customize how note file names are generated given the ID, target directory, and title.
		---@param spec { id: string, dir: obsidian.Path, title: string|? }
		---@return string|obsidian.Path The full path to the new note.
		note_path_func = function(spec)
			-- This is equivalent to the default behavior.
			local path = spec.dir / tostring(spec.id)
			return path:with_suffix(".md")
		end,

		-- Optional, boolean or a function that takes a filename and returns a boolean.
		-- `true` indicates that you don't want obsidian.nvim to manage frontmatter.
		disable_frontmatter = false,

		-- Optional, alternatively you can customize the frontmatter data.
		---@return table
		note_frontmatter_func = function(note)
			-- Add the title of the note as an alias.
			if note.title then
				note:add_alias(note.title)
			end

			local out = { id = note.id, aliases = note.aliases, tags = note.tags }

			-- `note.metadata` contains any manually added fields in the frontmatter.
			-- So here we just make sure those fields are kept in the frontmatter.
			if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
				for k, v in pairs(note.metadata) do
					out[k] = v
				end
			end

			return out
		end,

		-- Either 'wiki' or 'markdown'.
		preferred_link_style = "markdown",

		templates = {
			folder = templatePath,
			date_format = "%d.%m.%Y",
			time_format = "%H:%M",
		},

		ui = {
			enable = true,
			-- Use bullet marks for non-checkbox lists.
			bullets = {},
		},

		-- Specify how to handle attachments.
		attachments = {
			-- The default folder to place images in via `:ObsidianPasteImg`.
			-- If this is a relative path it will be interpreted as relative to the vault root.
			-- You can always override this per image by passing a full path to the command instead of just a filename.
			img_folder = attachmentsPath,
		},
	},
}
