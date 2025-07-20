require("config.options")
require("config.keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require("lazy").setup({
	require("plugins.neotree"),
	require("plugins.colortheme"),
	require("plugins.bufferline"),
	require("plugins.treesitter"),
	require("plugins.telescope"),
	require("plugins.typescripttools"),
	require("plugins.lsp"),
	require("plugins.formatting"),
	require("plugins.completions"),
	require("plugins.trouble"),
	require("plugins.gitsigns"),
	require("plugins.undotree"),
	require("plugins.harpoon"),
	require("plugins.refactoring"),
	require("plugins.misc"),
	require("plugins.debugger"),
	require("plugins.commenter"),
	require("plugins.testing"),
	require("plugins.lazygit"),
})

function _G.display_mode()
	local modes = {
		n = "-- NORMAL --",
		no = "-- NORMAL --",
		i = "-- INSERT --",
		v = "-- VISUAL --",
		V = "-- V-LINE --",
		[""] = "-- V-BLOCK --",
		c = "-- COMMAND --",
		cv = "-- COMMAND --",
		ce = "-- COMMAND --",
		r = "-- REPLACE --",
		R = "-- REPLACE --",
		s = "-- SELECT --",
		S = "-- S-LINE --",
		[""] = "-- S-BLOCK --",
		t = "-- TERMINAL --",
	}
	local mode_code = vim.api.nvim_get_mode().mode
	return modes[mode_code] or mode_code
end

vim.o.statusline = "%{v:lua.display_mode()}"
