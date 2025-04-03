return { -- Add indentation guides even on blank lines
	"lukas-reineke/indent-blankline.nvim",
	-- Enable `lukas-reineke/indent-blankline.nvim`
	-- See `:help ibl`
	main = "ibl",
	opts = {
		--indent = {highlight = {"Constant"},},
		scope = { enabled = true, highlight =  {"Function" },},
	},
}
