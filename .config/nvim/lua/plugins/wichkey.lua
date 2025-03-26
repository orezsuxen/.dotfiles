return { -- Useful plugin to show you pending keybinds.
	"folke/which-key.nvim",
	event = "VimEnter", -- Sets the loading event to 'VimEnter'
	opts = {
		win = {
			border = "single",

			-- margin = { 0, 0, 0, 0 }, -- top, right , bottom, left

			padding = { 0, 0, 1, 0 },
		},
	},
	config = function(_, opts) -- This is the function that runs, AFTER loading
		require("which-key").setup(opts)

		-- Document existing key chains
		-- require("which-key").register({
		-- 	["<leader>c"] = { name = "[c]ode", _ = "which_key_ignore" },
		-- 	["<leader>G"] = { name = "[G]it Repository", _ = "which_key_ignore" },
		-- 	["<leader>g"] = { name = "[g]it basics", _ = "which_key_ignore" },
		-- 	["<leader><tab>"] = { name = "[Tab]Tabs", _ = "which_key_ignore" },
		-- 	["<leader>s"] = { name = "[s]earch", _ = "which_key_ignore" },
		-- 	["<leader>W"] = { name = "[W]orkspace", _ = "which_key_ignore" },
		-- 	["<leader>w"] = { name = "[w]indow", _ = "which_key_ignore" },
		-- 	["<leader>t"] = { name = "[t]erminal", _ = "which_key_ignore" },
		-- 	["<leader>b"] = { name = "[b]uffers", _ = "which_key_ignore" },
		-- 	["<leader>l"] = { name = "[l]ists", _ = "which_key_ignore" },
		-- 	["<leader>u"] = { name = "[u]ser interface", _ = "which_key_ignore" },
		-- 	["<leader>x"] = { name = "[x]-Trouble", _ = "which_key_ignore" },
		-- })
		require("which-key").add({
			{ "<leader>c", group = "[c]ode" },
			{ "<leader>G", group = "[G]it Repository" },
			{ "<leader>g", group = "[g]it File" },
			{ "<leader><tab>", group = "[Tab]Tabs" },
			{ "<leader>s", group = "[s]earch" },
			{ "<leader>W", group = "[W]orkspace" },
			{ "<leader>w", group = "[w]indow" },
			{ "<leader>t", group = "[t]erminal" },
			{ "<leader>b", group = "[b]uffers" },
			{ "<leader>l", group = "[l]ists" },
			{ "<leader>u", group = "[u]tility" },
			{ "<leader>x", group = "[x]-Trouble" },

			{ "<leader>d", group = "[d]iagnostic" },
			{ "<leader>E", group = "[E]-NeoTree" },
			{ "<leader>m", group = "[m]arks" },
		}, {})
		-- visual mode
		-- require("which-key").register({
		-- 	["<leader>h"] = { "Git [H]unk" },
		-- }, { mode = "v" })
	end,
}
