return {
	"folke/todo-comments.nvim",
	event = "VimEnter",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		signs = true,
		highlight = {
			keyword = "bg",
		},
		keywords = {
			TEST = { icon = " ", color = "test", alt = { "TESTING", "PASSED", "FAILED", "DEBUG" } },
			GREEN = { icon = "", color = "#00FF00" },
			RED = { icon = "", color = "#FF0000" },
			BLUE = { icon = "", color = "#0000FF" },
			WHITE = { icon = "", color = "#FFFFFF", alt = { "REM", "LINE" } }, -- 
		},
	},
}
