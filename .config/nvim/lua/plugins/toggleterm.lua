return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		shading_factor = "0",
		--[[ things you want to change go here]]
		size = function(term)
			if term.direction == "horizontal" then
				return 15
			elseif term.direction == "vertical" then
				return vim.o.columns * 0.4
			end
		end,
	},
	config = function(_, opts)
		require("toggleterm").setup(opts)
		-- vim.keymap.set("n", "<leader>tt", ":ToggleTermToggleAll<CR>", { desc = "toggle all terminals" })
		vim.keymap.set("n", "<leader>tt", function()
			require("toggleterm").toggle_all()
		end, { desc = "toggle all teminals" })

		vim.keymap.set("n", "<leader>T", function()
			require("toggleterm").toggle_all()
		end, { desc = "toggle all teminals" })

		-- vim.keymap.set("n", "<leader>tv", ":ToggleTerm direction=vertical<CR>", { desc = "toggle term vertical" })
		vim.keymap.set("n", "<leader>tv", function()
			require("toggleterm").toggle(1, nil, nil, "vertical", nil)
		end, { desc = "toggle term vertical" })
		-- vim.keymap.set("n", "<leader>th", ":ToggleTerm direction=horizontal<CR>", { desc = "toggle term horizontal" })
		vim.keymap.set("n", "<leader>th", function()
			require("toggleterm").toggle(1, nil, nil, "horizontal", nil)
		end, { desc = "toggle term horizontal" })
		-- vim.keymap.set("n", "<leader>tf", ":ToggleTerm direction=float<CR>", { desc = "toggle term float" })
		vim.keymap.set("n", "<leader>tf", function()
			require("toggleterm").toggle(1, nil, nil, "float", nil)
		end, { desc = "toggle term float" })
		-- vim.keymap.set("n", "<leader>tT", ":ToggleTerm direction=tab<CR>", { desc = "toggle term in tab" })
		vim.keymap.set("n", "<leader>t<tab>", function()
			require("toggleterm").toggle(1, nil, nil, "tab", nil)
		end, { desc = "toggle term tab" })

		vim.keymap.set("n", "<leader>tn", ":ToggleTermSetName<CR>", { desc = "name terminal" })

		vim.keymap.set("n", "<leader>tsc", ":ToggleTermSendCurrentLine<CR>", { desc = "send current line to terminal" })
		vim.keymap.set("n", "<leader>tsv", ":ToggleTermSendVisualLines<CR>", { desc = "send visual line to terminal" })
		vim.keymap.set(
			"n",
			"<leader>tss",
			":ToggleTermSendVisualSelection<CR>",
			{ desc = "send visual selection to terminal" }
		)
	end,
}
