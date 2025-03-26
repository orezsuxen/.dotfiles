return { -- vim iluminate ( highlight current word)
	"RRethy/vim-illuminate",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		delay = 200,
		large_file_cutoff = 2000,
		large_file_overrides = {
			providers = {
				"lsp",
				"treesitter",
				"regex",
			},
		},
	},
	config = function(_, opts)
		require("illuminate").configure(opts)
		vim.api.nvim_set_hl(0, "IlluminatedWordText", { underline = true }) -- bg = "#080808" and so on
		vim.api.nvim_set_hl(0, "IlluminatedWordRead", { underline = true })
		vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { underline = true })
	end,
}
