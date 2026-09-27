return {
	{
		"ibhagwan/fzf-lua",
		-- Optional for icon support; mini.icons/mini.nvim is also supported.
		dependencies = { "nvim-mini/mini.icons" },
		---@module "fzf-lua"
		---@type fzf-lua.Config|{}
		---@diagnostic disable: missing-fields
		opts = {
			files = {
				hidden = true,
			},
		},
		keys = {
			{
				"<leader><leader>",
				function()
					require("fzf-lua").files()
				end,
				desc = "Open file fuzzy finder",
			},
			{
				"<leader>rg",
				function()
					require("fzf-lua").live_grep()
				end,
				desc = "Regex search files with ripgrep",
			},
			{
				"<leader>sr",
				function()
					require("fzf-lua").grep()
				end,
				desc = "Fuzzy search files with ripgrep",
			},
		},
		---@diagnostic enable: missing-fields
	},
}
