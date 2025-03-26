return {
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>GG", "<cmd>Git<CR>", { desc = "Git Fugitive" })
		end,
	}, -- vim git wrapper
	"tpope/vim-rhubarb", -- git hub extension for fugitive
}
