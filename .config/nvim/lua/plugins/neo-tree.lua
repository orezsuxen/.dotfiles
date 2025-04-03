return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	keys = {
		{ "<leader>e",  ":Neotree reveal toggle left<CR>",       { desc = "NeoTree reveal" } },
		{ "<leader>Eb", ":Neotree buffers reveal toggle<CR>",    { desc = "Neotree buffers" } },
		{ "<leader>Eg", ":Neotree git_status reveal toggle<CR>", { desc = "Neotree git_status" } },
		{ "<leader>Ef", ":Neotree reveal toggle float<CR>",      { desc = "Neotree reveal in float" } },
	},
	opts = {
		filesystem = {
			window = {
				mappings = {
					["\\"] = "close_window",
					["<space>"] = { "toggle_node", nowait = true },
				},
			},
		},
	},
}
