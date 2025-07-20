return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = { "TroubleToggle", "Trouble" },
	config = function()
		local trouble = require("trouble")

		trouble.setup({
			position = "bottom",
			height = 10,
			width = 50,
			icons = true,
			mode = "workspace_diagnostics",
			fold_open = "",
			fold_closed = "",
			group = true,
			padding = true,
			action_keys = {
				close = "q",
				cancel = "<esc>",
				refresh = "r",
				jump = { "<cr>", "<tab>" },
				open_split = { "s" },
				open_vsplit = { "v" },
				open_tab = { "t" },
				jump_close = { "o" },
				toggle_mode = "m",
				toggle_preview = "P",
				hover = "K",
				preview = "p",
				close_folds = { "zM" },
				open_folds = { "zR" },
				toggle_fold = { "zA" },
				previous = "k",
				next = "j",
			},
			use_diagnostic_signs = true,
		})

		-- Keymaps globales para abrir Trouble rápidamente
		local opts = { noremap = true, silent = true }

		-- Toggle panel con <leader>xx
		vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)

		-- Abrir diagnósticos de workspace con <leader>xw
		vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)

		-- Abrir diagnósticos de documento con <leader>xd
		vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opts)

		-- Abrir errores rápidos con <leader>xq
		vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)

		-- Abrir lista de loclist con <leader>xl
		vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", opts)
	end,
}
