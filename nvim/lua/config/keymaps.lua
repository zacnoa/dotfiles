vim.keymap.set("n", "<S-h>", "<cmd>tabprevious<cr>", { desc = "Previous tab", silent = true })
vim.keymap.set("n", "<S-l>", "<cmd>tabnext<cr>", { desc = "Next tab", silent = true })
vim.keymap.set("n", "<leader>sr", function()
	require("grug-far").open()
end, { desc = "Search and replace" })

vim.keymap.set("n", "<C-w>", "<cmd>q<cr>", {
	desc = "Close window",
	nowait=true,
})
vim.keymap.set("n", "<M-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<M-j>", "<C-w>j", { desc = "Go to window below" })
vim.keymap.set("n", "<M-k>", "<C-w>k", { desc = "Go to window above" })
vim.keymap.set("n", "<M-l>", "<C-w>l", { desc = "Go to right window" })


vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, {
				buffer = event.buf,
				desc = desc,
			})
		end

		map("K", vim.lsp.buf.hover, "Hover documentation")

		map("<leader>gd", function()
			vim.cmd("tab split")
			vim.lsp.buf.definition()
		end, "Go to definition in new tab")

		map("<leader>gr", vim.lsp.buf.references, "References")

		map("<leader>ld", function()
			vim.diagnostic.open_float({
				scope = "line",
				focus = false,
				severity = {
					vim.diagnostic.severity.ERROR,
					vim.diagnostic.severity.WARN,
				},
			})
		end, "Show errors and warnings")

		map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")

		map("<leader>ca", vim.lsp.buf.code_action, "Code action")
	end,
})
