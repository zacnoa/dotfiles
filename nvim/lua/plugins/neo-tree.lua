return {

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
		},
		opts = {
			filesystem = {
				window = {
					mappings = {
						["l"] = "open",
						["s"] = "open_split",
						["v"] = "open_vsplit",
					},
				},
			},
		},
		keys = {
			-- {
			-- 	"<leader>e",
			-- 	function()
			-- 		require("neo-tree.command").execute({
			-- 			toggle = true,
			-- 			source = "filesystem",
			-- 			position = "left",
			-- 		})
			-- 	end,
			-- 	desc = "File tree",
			-- },
			{
				"<leader>b",
				function()
					require("neo-tree.command").execute({
						toggle = true,
						source = "buffers",
						position = "right",
					})
				end,
				desc = "Buffers",
			},
		},
		lazy = false, -- neo-tree will lazily load itself
	},
}
