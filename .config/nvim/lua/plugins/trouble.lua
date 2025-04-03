return {
	"folke/trouble.nvim",
	opts = {
		modes = {
			lsp = {
				win = { position = "right", size = { width = (vim.o.columns / 5) } },
			},
		},
	},
	config = function(_, opts)
		require("trouble").setup(opts)

		vim.keymap.set("n", "<leader>xx", function()
			require("trouble").toggle("diagnostics")
		end, { desc = "toggle trouble" })

		vim.keymap.set("n", "<leader>xX", function()
			require("trouble").toggle("diagnostics")
		end, { desc = "toggle trouble" })

		vim.keymap.set("n", "<leader>ls", function()
			require("trouble").toggle("symbols")
		end, { desc = "list symbols" })

		vim.keymap.set("n", "<leader>lS", function()
			require("trouble").toggle("symbols").opts.win.position = "left"
		end, { desc = "list symbols left side" })

		vim.keymap.set("n", "<leader>ll", function()
			require("trouble").toggle("lsp")
		end, { desc = "list LSP information" })

		vim.keymap.set("n", "<leader>lL", function()
			require("trouble").toggle("lsp").opts.win.position = "left"
		end, { desc = "list LSP information" })

		vim.keymap.set("n", "<leader>xL", function()
			require("trouble").toggle("loclist")
		end, { desc = "toggle trouble loclist" })

		vim.keymap.set("n", "<leader>xQ", function()
			require("trouble").toggle("quickfix")
		end, { desc = "toggle trouble quickfixlist" })

		vim.keymap.set("n", "<leader>xj", function() end, { desc = "toggle trouble quickfixlist" })

		vim.keymap.set("n", "<leader>xk", function() end, { desc = "toggle trouble quickfixlist" })
	end,
}
