-- [[ Basic Keymaps ]]

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Map leader + w to save current file in normal mode
vim.keymap.set("n", "<leader>w", ":write<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", ":quit<CR>", { noremap = true, silent = true })

-- Map leader + y and leader + p to handle copy+paste with the system clipboard in normal and visual mode
vim.keymap.set({ "n", "v" }, "<leader>Y", '"+y', { desc = "[Y]ank to OS clipboard", noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<leader>P", '"+p', { desc = "[P]ast from OS clipboard", noremap = true, silent = true })

-- Switch between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Window resize
vim.keymap.set("n", "<C-Up>", ":resize -2 <CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Down>", ":resize +2 <CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2 <CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2 <CR>", { noremap = true, silent = true })

-- LSP formatting
vim.keymap.set("n", "<leader>fm", function()
	vim.lsp.buf.format({ async = true })
end, { desc = "LSP formatting", noremap = true, silent = true })

-- XML formatting using xmllint
vim.keymap.set(
	"n",
	"<leader>fx",
	"<cmd>%!xmllint --format - <CR>",
	{ desc = "XML formatting", noremap = true, silent = true }
)

-- JSON formatting using jq
vim.keymap.set("n", "<leader>fj", "<cmd>%!jq '.' <CR>", { desc = "JSON formatting", noremap = true, silent = true })

-- Buffer options
vim.keymap.set("n", "<leader>bb", ":enew <CR>", { desc = "New buffer", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bd", ":bd <CR>", { desc = "Close buffer", noremap = true, silent = true })

-- Quick-fix list options
vim.keymap.set("n", "<leader>j", "<cmd>cprev<CR>", { desc = "Quick-fix up", noremap = true, silent = true })
vim.keymap.set("n", "<leader>k", "<cmd>cnext<CR>", { desc = "Quick-fix down", noremap = true, silent = true })
