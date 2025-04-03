return { -- Useful plugin to show you pending keybinds.
	"folke/which-key.nvim",
	event = "VimEnter", -- Sets the loading event to 'VimEnter'
	opts = {
      -- false | "classic" | "modern" | "helix"
        preset = 'helix',
		--win = {
			--border = "single",

			-- margin = { 0, 0, 0, 0 }, -- top, right , bottom, left

			--padding = { 0, 0, 1, 0 },
		--},
	},
	config = function(_, opts) -- This is the function that runs, AFTER loading
		require("which-key").setup(opts)

		-- Document existing key chains
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
			--{ "<leader>m", group = "[m]arks" },
      --TEST:
      { "y" , group = "[y]oink" },
      { "c" , group = "[c]hange"},
      { "m" , group = "[m]ark"},
		}, {})
		-- visual mode
		-- require("which-key").register({
		-- 	["<leader>h"] = { "Git [H]unk" },
		-- }, { mode = "v" })
	end,
}
