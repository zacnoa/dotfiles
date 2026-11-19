return {
	{
		"ibhagwan/fzf-lua",
		-- Optional for icon support; mini.icons/mini.nvim is also supported.
		dependencies = { "nvim-mini/mini.icons" },
		---@module "fzf-lua"
		---@type fzf-lua.Config|{}
		---@diagnostic disable: missing-fields
		opts = function()
			return {
				actions = {
					files = {
						true,
						["ctrl-h"] = require("fzf-lua").actions.file_split,
						["ctrl-s"] = false,
					},
				},
			}
		end,
		keys = {
			{
				"<leader><leader>",
				function()
					require("fzf-lua").files()
				end,
				desc = "Open file fuzzy finder",
			},
			{
				"<leader>ss",
				function()
					require("fzf-lua").live_grep()
				end,
				desc = "search files with ripgrep",
			},
		},
		---@diagnostic enable: missing-fields
	},
}
