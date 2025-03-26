return { -- Adds git related signs to the gutter, as well as utilities for managing changes
	"lewis6991/gitsigns.nvim",
	opts = {
		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			map("n", "]c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "]c", bang = true })
				else
					gitsigns.nav_hunk("next")
				end
			end, { desc = "Jump to next git [c]hange" })

			map("n", "[c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[c", bang = true })
				else
					gitsigns.nav_hunk("prev")
				end
			end, { desc = "Jump to previous git [c]hange" })

			-- Actions
			-- visual mode
			map("v", "<leader>gs", function()
				gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "stage git hunk" })
			map("v", "<leader>gr", function()
				gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "reset git hunk" })
			-- normal mode
			map("n", "<leader>gp", gitsigns.preview_hunk, { buffer = bufnr, desc = "Preview git hunk" })
			map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "git [s]tage hunk" })
			map("n", "<leader>gv", gitsigns.show, { buffer = bufnr, desc = "show Git Verion" })
			map("n", "<leader>gh", gitsigns.select_hunk, { buffer = bufnr, desc = "Hunk Select" })
			map("n", "<leader>gk", function()
				gitsigns.nav_hunk('prev')
			end, { buffer = bufnr, desc = "Previous Hunk" })
			map("n", "<leader>gj", function()
				gitsigns.nav_hunk('next')
			end, { buffer = bufnr, desc = "Next Hunk" })

			map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "git [r]eset hunk" })
			map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "git [S]tage buffer" })
			-- old
			-- map("n", "<leader>gu", gitsigns.undo_stage_hunk, { desc = "git [u]ndo stage hunk" })
			map("n", "<leader>gu", gitsigns.stage_hunk, { desc = "git [u]ndo stage hunk" })
			map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "git [R]eset buffer" })
			map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "git [p]review hunk" })
			map("n", "<leader>gb", gitsigns.blame_line, { desc = "git [b]lame line" })
			map("n", "<leader>gd", gitsigns.diffthis, { desc = "git [d]iff against index" })
			map("n", "<leader>gD", function()
				gitsigns.diffthis("@")
			end, { desc = "git [D]iff against last commit" })
			-- Toggles
			map("n", "<leader>gtb", gitsigns.toggle_current_line_blame, { desc = "[T]oggle git show [b]lame line" })
			map("n", "<leader>gtw", gitsigns.toggle_word_diff, { buffer = bufnr, desc = "Toggle Word Diff" })
			map("n", "<leader>gts", gitsigns.toggle_signs, { buffer = bufnr, desc = "Toggle Signs" })

			-- NOTE: somehow not working
			-- should be working if made as "<cmd>foo<CR>" style of commands
			-- map("n", "<leader>gtd", gitsigns.preview_hunk_inline, { desc = "[T]oggle git show [D]eleted" })
			-- map("n", "<leader)gtl", gitsigns.toggle_linehl, { desc = "Toggle Line Highlights" })
			-- map("n", "<leader)gtn", gitsigns.toggle_numhl, { desc = "Toggle Number Highlights" })

			-- list
			map("n", "<leader>lg", gitsigns.setloclist, { buffer = bufnr, desc = "Gitsigns list" })
		end,
	},
}
