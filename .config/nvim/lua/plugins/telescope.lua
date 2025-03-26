return { -- Fuzzy Finder (files, lsp, etc)
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ -- If encountering errors, see telescope-fzf-native README for installation instructions
			"nvim-telescope/telescope-fzf-native.nvim",
			"debugloop/telescope-undo.nvim",
			"nvim-telescope/telescope-project.nvim",

			-- `build` is used to run some command when the plugin is installed/updated.
			-- This is only run then, not every time Neovim starts up.
			build = "make",

			-- `cond` is a condition used to determine whether this plugin should be
			-- installed and loaded.
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },

		-- Useful for getting pretty icons, but requires a Nerd Font.
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		require("telescope").setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		-- Enable Telescope extensions if they are installed
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")
		pcall(require("telescope").load_extension, "project")

		-- See `:help telescope.builtin`
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>sS", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
		-- vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
		vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

		vim.keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })

		vim.keymap.set("n", "<leader>s/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "[S]earch [/] in Open Files" })

		vim.keymap.set("n", "<leader>sN", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[S]earch [N]eovim files" })

		-- git stuff
		vim.keymap.set("n", "<leader>Gf", require("telescope.builtin").git_files, { desc = "Search Git Files" })
		vim.keymap.set("n", "<leader>Gs", require("telescope.builtin").git_status, { desc = "Search Git Status" })
		vim.keymap.set("n", "<leader>Gc", require("telescope.builtin").git_commits, { desc = "Search Git Commits" })
		vim.keymap.set("n", "<leader>Gb", require("telescope.builtin").git_branches, { desc = "Search Git Branches" })
		vim.keymap.set("n", "<leader>Gz", require("telescope.builtin").git_stash, { desc = "Search Git Stash" })
		vim.keymap.set(
			"n",
			"<leader>Gl",
			require("telescope.builtin").git_bcommits,
			{ desc = "Search Git branch Commits" }
		)
		-- other stuff
		vim.keymap.set("n", "<leader>so", require("telescope.builtin").oldfiles, { desc = "Oldfiles" })
		vim.keymap.set("n", '<leader>s"', require("telescope.builtin").registers, { desc = "Registers" })
		vim.keymap.set(
			"n",
			"<leader>:",
			require("telescope.builtin").command_history,
			{ desc = "[:] Find Command History" }
		)
		vim.keymap.set("n", "<leader>sA", require("telescope.builtin").autocommands, { desc = "Autocommands" })
		vim.keymap.set("n", "<leader>sH", require("telescope.builtin").highlights, { desc = "Highlights" })
		vim.keymap.set("n", "<leader>sK", require("telescope.builtin").keymaps, { desc = "Keymaps" })
		vim.keymap.set("n", "<leader>sm", require("telescope.builtin").marks, { desc = "Marks" })
		vim.keymap.set("n", "<leader>sO", require("telescope.builtin").vim_options, { desc = "Vim Options" })
		vim.keymap.set("n", "<leader>sC", function()
			require("telescope.builtin").colorscheme({ enable_preview = true })
		end, { desc = "Colorschemes" })
		-- extensions
		vim.keymap.set("n", "<leader>su", function()
			require("telescope").extensions.undo.undo({ side_by_side = true })
		end, { desc = "Undo History" })
		vim.keymap.set("n", "<leader>st", "<cmd>TodoTelescope<CR>", { desc = "Search TodoList" })
		vim.keymap.set("n", "<leader>sp", function()
			require("telescope").extensions.project.project({})
		end, { desc = "Projects" })
	end,
}
