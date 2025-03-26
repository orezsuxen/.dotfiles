return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		-- add any options here
		cmdline = {
			view = "cmdline", --cmdline_popup
			format = {
				search_down = {
					view = "cmdline",
				},
				search_up = {
					view = "cmdline",
				},
				cmdline = { icon = ":" },
			},
		}, --cmdline
		presets = {
			bottom_search = true, -- use a classic bottom cmdline for search
			-- command_palette = true, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = false, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = true, -- add a border to hover docs and signature help
		},
		views = {
			cmdline = {
				position = {
					col = 10, --"50%"
				},
				size = {
					width = "50%", --"auto"
					height = "auto",
				},
			},
			cmdline_popup = {
				position = {
					row = -10,
					col = 10, --"50%"
				},
				size = {
					width = 60,
					height = "auto",
				},
				border = {
					style = "none",
					padding = { 0, 0 },
				},
			},
			popupmenu = {
				relative = "editor",
				position = {
					row = 50,
					col = "50%",
				},
				size = {
					width = 60,
					height = 10,
				},
				border = {
					style = "rounded",
					padding = { 0, 1 },
				},
				win_options = {
					winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
				},
			},
		},
	},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		-- "rcarriga/nvim-notify",
	},
}
