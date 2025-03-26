return {
	-- Lualine as statusline
	"nvim-lualine/lualine.nvim",
	-- See `:help lualine.txt`
	opts = {
		options = {
			icons_enabled = true,
			theme = "auto",
			-- section_separators = { left = '', right = ''},
			-- component_separators = { left = '', right = ''},
			-- section_separators = { left = '', right = '' },
			-- component_separators = { left = '', right = '' }
			section_separators = { left = "", right = "" },
			component_separators = { left = "", right = "" },
			-- section_separators = { left = '▙', right = '▟'},
			-- component_separators = { left = '▚', right = '▞'},
			-- ░ ▒ ▓ ╲ ╱                      ▙ ▚ ▞ ▟
		},
		sections = {
			lualine_a = { { "mode", icons_enabled = true } },
			lualine_b = {
				{
					"macro_recording",
					fmt = function()
						local recording_register = vim.fn.reg_recording()
						if recording_register == "" then
							return ""
						else
							return "Rec 󰳻 " .. recording_register
							-- 󰳻 󰑋 󰳼
						end
					end,
				},

				"branch",
				"diff",
				{
					"diagnostics",
					symbols = {
						error = " ",
						warn = " ",
						info = " ",
						hint = " ",
					},
				},
			},
			lualine_c = {
				-- "selectioncount",
				-- "searchcount",
				-- {
				-- 	"buffers",
				-- 	mode = 2,
				-- 	use_mode_colors = true,
				-- 	buffers_color = {
				-- 		active = { gui = "bold,italic", fg = "black", bg = "grey" },
				-- 	},
				-- },
				--[['selectioncount','searchcount','filetype',--]]
			},
			lualine_x = { --[[ 'encoding', 'fileformat','buffers','tabs','filename', 'filesize'--]]
				-- {
				-- 	"buffers",
				-- 	mode = 2,
				-- 	use_mode_colors = true,
				-- 	buffers_color = {
				-- 		active = { gui = "bold,italic", fg = "black", bg = "grey" },
				-- 	},
				--},
				"selectioncount",
				"searchcount",
			},
			lualine_y = {
				{
					"buffers",
					mode = 2,
					use_mode_colors = true,
					-- buffers_color = {
					-- 	active = { gui = "bold,italic", fg = "black", bg = "grey" },
					-- },
				},
				-- "encoding",
				-- "fileformat",
				-- "filesize" --[[ 'progress', 'location', ]],
			},
			lualine_z = {
				{
					"tabs",
					mode = 0,
					use_mode_colors = true,
					show_modified_status = false,
					symbols = { modified = "+" },
				},
				"progress",
				"location", --[[ function() return " " .. os.date("%R") end, ]]
			},
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
	},
	config = function(_, opts)
		local trouble = require("trouble")
		local symbols = trouble.statusline({
			mode = "lsp_document_symbols",
			groups = {},
			title = false,
			filter = { range = true },
			format = "{kind_icon}{symbol.name:Normal}",
			-- The following line is needed to fix the background color
			-- Set it to the lualine section you want to use
			hl_group = "NonText",
		})
		table.insert(opts.sections.lualine_c, {
			symbols.get,
			cond = symbols.has,
		})

		require("lualine").setup(opts)
		vim.keymap.set("n", "<leader>b1", "<cmd>LualineBuffersJump! 1<cr>", { desc = "Jump to Buffer 1" })
		vim.keymap.set("n", "<leader>b2", "<cmd>LualineBuffersJump! 2<cr>", { desc = "Jump to Buffer 2" })
		vim.keymap.set("n", "<leader>b3", "<cmd>LualineBuffersJump! 3<cr>", { desc = "Jump to Buffer 3" })
		vim.keymap.set("n", "<leader>b4", "<cmd>LualineBuffersJump! 4<cr>", { desc = "Jump to Buffer 4" })
		vim.keymap.set("n", "<leader>b5", "<cmd>LualineBuffersJump! 5<cr>", { desc = "Jump to Buffer 5" })
		vim.keymap.set("n", "<leader>b6", "<cmd>LualineBuffersJump! 6<cr>", { desc = "Jump to Buffer 6" })
		vim.keymap.set("n", "<leader>b7", "<cmd>LualineBuffersJump! 7<cr>", { desc = "Jump to Buffer 7" })
		vim.keymap.set("n", "<leader>b8", "<cmd>LualineBuffersJump! 8<cr>", { desc = "Jump to Buffer 8" })
		vim.keymap.set("n", "<leader>b9", "<cmd>LualineBuffersJump! 9<cr>", { desc = "Jump to Buffer 9" })
	end,
}
