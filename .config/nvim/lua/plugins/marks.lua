return {
	"chentoast/marks.nvim",
	opts = {},
	config = function(_, opts)
		require("marks").setup(opts)
		vim.keymap.set("n", "<leader>mm", function()
			require("marks").toggle()
		end, { desc = "toggle mark" })
		vim.keymap.set("n", "<leader>ma", function()
			require("marks").annotate()
		end, { desc = "annotate mark" })
		vim.keymap.set("n", "<leader>mp", function()
			require("marks").preview()
		end, { desc = "preview mark" })
	end,
}
