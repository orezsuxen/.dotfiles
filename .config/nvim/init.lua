-- neovim init file
-- stuff to remember
-- :%g/pattern/cmd -- to execute cmd on pattern
-- :%v/pattern/cmd -- to execute cmd on everyline not matching pattern
-- :%g/pattern/v/notpatten/cmd -- both of the above
-- insert mode <C-o> to execute cmd in normal mode

--==============================================
-- options
--==============================================
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true
vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.showmode = false --already in statusline
-- vim.opt.clipboard = "unnamedplus"
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "auto:1-3"
vim.opt.completeopt = "menu,menuone,noinsert,preview"

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true --list stuff like trailing spaces
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣", precedes = "" } -- eol = "↲"

vim.opt.inccommand = "split" -- preview substitutions live
vim.opt.cursorline = true

vim.opt.scrolloff = 10 --lines to keep above or below cursor

vim.opt.hlsearch = true

-- from myself
vim.opt.autowrite = true -- Enable auto write
--TEST:
vim.opt.cmdheight = 1 -- cmdline height
-- vim.opt.pumblend = 20          -- Popup blend
-- vim.opt.pumheight = 15         -- Maximum number of entries in a popup
vim.opt.expandtab = true -- Use spaces instead of tabs
-- vim.opt.sidescrolloff = 8      -- Columns of context
-- vim.opt.smartindent = true     -- Insert indents automatically
vim.opt.relativenumber = true -- Relative line numbers
-- vim.opt.grepformat = "%f:%l:%c:%m" -- some grep helper ?
-- vim.opt.grepprg = "rg --vimgrep" -- use ripgrep
vim.opt.laststatus = 3         -- when to display a status line
vim.opt.tabstop = 2            -- Number of spaces tabs count for
vim.opt.termguicolors = true   -- True color support
vim.opt.wrap = false           -- Disable line wrap
vim.opt.colorcolumn = "80,100" -- color column
-- vim.opt.showcmd = false -- showcmd
vim.opt.shortmess:append({ W = true, I = true, c = true })
vim.opt.showtabline = 0

-- terminal opt for win systems
-- vim.opt.shell = "pwsh"
-- vim.opt.shellcmdflag = "-nologo -noprofile -ExecutionPolicy RemoteSigned -command"
-- vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
-- vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
-- vim.opt.shellquote = ""
-- vim.opt.shellxquote = ""

-- folding
--
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldnestmax = 5
-- vim.opt.foldcolumn = "1"
vim.opt.foldtext = ""

-- function _G.custom_fold_text()
-- 	-- local text = vim.treesitter.foldtext()
-- 	local line = vim.fn.getline(vim.v.foldstart)
-- 	local line_count = vim.v.foldend - vim.v.foldstart + 1
-- 	return " " .. line .. " :: " .. line_count .. " lines "
-- end

--[[  ↓ ∇ ▼      ]]
-- vim.opt.foldtext = "v:lua.custom_fold_text()"

--[[
function MyFoldtext()
	local text = vim.treesitter.foldtext()

	local n_lines = vim.v.foldend - vim.v.foldstart
	local text_lines = " lines"

	if n_lines == 1 then
		text_lines = " line"
	end

	table.insert(text, { " - " .. n_lines .. text_lines, { "Folded" } })

	return text
end

vim.opt.foldtext = "v:lua.MyFoldtext()"
]]

vim.opt.fillchars = {
	eob = "",
	fold = "═",
}
-- vim.api.nvim_set_hl(0, "Folded", { fg = "#5C6370"  })

--==============================================
-- keymaps
--==============================================

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader><CR>", "<C-]>")

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- basic navigation helper
vim.keymap.set("n", "<A-j>", "<C-d>", { desc = "Scroll down" })
vim.keymap.set("n", "<A-k>", "<C-u>", { desc = "Scroll up" })
vim.keymap.set("i", "<A-l>", "<C-o>A", { desc = "goto end of line" })
vim.keymap.set("i", "<A-h>", "<C-o>I", { desc = "goto start of line" })

-- diagnostics
-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
-- vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
-- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
--
-- lists views
vim.keymap.set("n", "<leader>ld", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
vim.keymap.set("n", "<leader>le", vim.diagnostic.open_float, { desc = "Show diagnostic Error messages" })
--NOTE: vim.keymap.set("n", "<leader>lt", "<cmd>TodoLocList<CR>", { desc = "Todo Location List" })

-- terminal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- windows navigation 2 electric bogaloo
vim.keymap.set("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
vim.keymap.set("n", "<leader>wc", "<C-W>c", { desc = "Close window", remap = true })
vim.keymap.set("n", "<leader>ws", "<C-W>s", { desc = "Split window below", remap = true })
vim.keymap.set("n", "<leader>wv", "<C-W>v", { desc = "Split window right", remap = true })
vim.keymap.set("n", "<leader>wo", "<C-W>o", { desc = "Close other windows", remap = true })

-- select window
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Go to upper window", remap = true })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Go to right window", remap = true })

-- tab handling
vim.keymap.set("n", "<leader><tab>j", "<cmd>tablast<cr>", { desc = "Last Tab" })
vim.keymap.set("n", "<leader><tab>k", "<cmd>tabfirst<cr>", { desc = "First Tab" })
vim.keymap.set("n", "<leader><tab>n", "<cmd>tabnew<cr>", { desc = "New Tab" })
vim.keymap.set("n", "<leader><tab>h", "<cmd>tabprevious<cr>", { desc = "Next Tab" })
vim.keymap.set("n", "<leader><tab>c", "<cmd>tabclose<cr>", { desc = "Close Tab" })
vim.keymap.set("n", "<leader><tab>l", "<cmd>tabnext<cr>", { desc = "Previous Tab" })

-- resize window with arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- move lines with alt
-- vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
-- vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move line down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move line up" })

--no bufferline
vim.keymap.set("n", "<leader>bn", "<cmd>enew<cr>", { desc = "New buffer" })
vim.keymap.set("n", "<leader>bl", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bh", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<leader>bc", "<cmd>bdelete!<cr>", { desc = "Close buffer" })
vim.keymap.set("n", "<A-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<A-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bo", function()
	local bufs = vim.api.nvim_list_bufs()
	local current_buf = vim.api.nvim_get_current_buf()
	for _, i in ipairs(bufs) do
		if i ~= current_buf then
			vim.api.nvim_buf_delete(i, {})
		end
	end
end, { desc = "Close all other buffers" })

-- better n function at search
-- vim.keymap.set("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
-- vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
-- vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
-- vim.keymap.set("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
-- vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
-- vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- undo breackpoints
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", ";", ";<c-g>u")

-- better indent
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")


--TEST:
vim.keymap.set("n", "J", "" )
--
-- autocmds from kickstart
--
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
-- define stuff
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo", numhl = "" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn", numhl = "" })
vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError", numhl = "" })
vim.fn.sign_define("DiagnosticSignHint", { text = " ", texthl = "DiagnosticSignHint", numhl = "" })
vim.fn.sign_define("DiagnosticSignOk", { text = " ", texthl = "DiagnosticSignOk", numhl = "" })
--==============================================
-- setup lazy
--==============================================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
---@diagnostic disable-next-line: undefined-field
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

--==============================================
-- Import Plugins
--==============================================
local P = {
	{ import = "plugins" },
}

--==============================================
-- start lazy
--==============================================

require("lazy").setup(P)


-- vim.cmd.colorscheme("github_dark_dimmed")
