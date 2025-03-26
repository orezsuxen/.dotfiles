return {
	-- Theme inspired by Atom
	"olimorris/onedarkpro.nvim",
	-- 'navarasu/onedark.nvim',
	-- opts = {
	--   options = {
	--     cursorline = true,
	--     transparency = true,
	--   },
	-- },
	priority = 1000,
	config = function()
		require("onedarkpro").setup({
			options = {
				cursorline = true,
				transparency = true,
			},
		})
	end,
}
