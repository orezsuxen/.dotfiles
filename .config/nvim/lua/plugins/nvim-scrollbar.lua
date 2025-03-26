return { -- nvim scrollbar
	"petertriho/nvim-scrollbar",
	opts = {
		handle = {
			text = "  ",
		},
		marks = {
			Cursor = {
				text = "<-",
			},
			Search = {
				text = { "- ", "= " },
			},
			Hint = {
				text = { "-", "=" },
				--
			},
			Error = {
				text = { "-", "=" },
				--
			},
			Warn = {
				text = { "-", "=" },
				-- 
			},
			Info = {
				text = { "-", "=" },
				-- 
			},
			Misc = {
				text = { "-", "=" },
				--
			},
			GitAdd = {
				text = { "-", "=" },
			},
			GitChange = {
				text = { "-", "=" },
			},
			GitDelete = {
				text = { "󰍵-", "󰍵=" },
			},
			-- ╪┼├ ┤󰍵
		},
	},
	-- handlers = {
	--   gitsigns = true, -- Requires gitsigns
	--   -- search = true, -- requires hlslens
	-- },
	config = function(_, opts)
		require("scrollbar").setup(opts)
	end,
}
