local M = {}

function M.display_mode()
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

return M
