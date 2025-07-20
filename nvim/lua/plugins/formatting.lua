return {
	{
		"stevearc/conform.nvim",
		opts = {
			-- Configuramos qué formateadores usar por filetype
			formatters_by_ft = {
				javascript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescript = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				json = { "prettierd" },
				markdown = { "prettierd" },
				yaml = { "prettierd" },
				lua = { "stylua" },
			},
			-- Opcional: configura timeout
			format_on_save = {
				lsp_fallback = true, -- si eslint_d falla, usa LSP
				timeout_ms = 1000,
			},
		},
		config = function(_, opts)
			require("conform").setup(opts)

			-- Auto formateo antes de guardar, solo para ciertos tipos de archivo
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = {
					"*.js",
					"*.jsx",
					"*.ts",
					"*.tsx",
					"*.json",
					"*.md",
					"*.yaml",
					"*.lua",
				},
				callback = function(args)
					require("conform").format({ bufnr = args.buf })
				end,
			})

			-- Keymap opcional: <leader>f para formatear manualmente
			vim.keymap.set("n", "<leader>f", function()
				require("conform").format({ async = true, lsp_fallback = true })
			end, { desc = "Format file" })
		end,
	},
}
