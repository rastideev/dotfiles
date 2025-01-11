-- [[ Plugin to improve viewing Markdown files in Neovim ]]
-- https://github.com/MeanderingProgrammer/render-markdown.nvim

---@type LazyPluginSpec
return {
	"MeanderingProgrammer/render-markdown.nvim",
	ft = { "markdown", "quarto" },
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {},
}
