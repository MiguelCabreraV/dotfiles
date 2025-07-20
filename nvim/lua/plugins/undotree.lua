return {
	"mbbill/undotree",
	config = function()
		-- Map <leader>u to toggle the undo tree panel
		vim.keymap.set("n", "<leader>u", function()
			vim.cmd.UndotreeToggle()
		end, { desc = "Toggle Undotree" })
	end,
}
