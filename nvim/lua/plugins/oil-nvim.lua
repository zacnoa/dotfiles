return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		keymaps = {

			["g?"] = { "actions.show_help", mode = "n" },
			["<CR>"] = { "actions.select" },
			["<C-v>"] = { "actions.select", opts = { vertical = true }, mode = "n" },
			["<C-h>"] = { "actions.select", opts = { horizontal = true }, mode = "n" },
			["<C-t>"] = { "actions.select", opts = { tab = true }, mode = "n" },
		},
	},
	keys = {
		{ "<leader>e", "<cmd>leftabove vertical Oil<cr>", desc = "Open Oil on the left" },
	},
	-- Optional dependencies
	dependencies = { { "nvim-mini/mini.icons", opts = {} } },
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,
}
