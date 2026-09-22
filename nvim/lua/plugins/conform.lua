return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
			},

			format_on_save = {
				timeout_ms = 500,
				lsp_format = "never",
			},
		},
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true })
				end,
				desc = "Format buffer",
			},
		},
	},
}
