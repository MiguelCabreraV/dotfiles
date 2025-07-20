return {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = false,
	priority = 1000,
	config = function()
		vim.opt.termguicolors = true
		vim.opt.background = "dark"
		
		require("rose-pine").setup({
			variant = "main", -- auto, main, moon, or dawn
			dark_variant = "main", -- main, moon, or dawn
			dim_inactive_windows = false,
			extend_background_behind_borders = true,
			
			enable = {
				terminal = true,
				legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
				migrations = true, -- Handle deprecated options automatically
			},
			
			styles = {
				-- Primeagen style - no italics, no bold, clean look
				bold = false,
				italic = false,
				transparency = true,
			},
			
			groups = {
				-- Primeagen prefers subtle colors, not too much contrast
				border = "muted",
				link = "iris",
				panel = "surface",
				
				error = "love",
				hint = "iris",
				info = "foam",
				note = "pine",
				todo = "rose",
				warn = "gold",
				
				git_add = "foam",
				git_change = "rose",
				git_delete = "love",
				git_dirty = "rose",
				git_ignore = "muted",
				git_merge = "iris",
				git_rename = "pine",
				git_stage = "iris",
				git_text = "rose",
				git_untracked = "subtle",
				
				-- Primeagen's preferred highlight groups
				h1 = "iris",
				h2 = "foam",
				h3 = "rose",
				h4 = "gold",
				h5 = "pine",
				h6 = "foam",
			},
			
			palette = {
				-- Override colors if needed - Primeagen usually keeps defaults
			},
			
			highlight_groups = {
				-- Primeagen-style customizations
				Comment = { fg = "muted" },
				VertSplit = { fg = "muted", bg = "muted" },
				
				-- Make background transparent like Primeagen
				Normal = { bg = "none" },
				NormalFloat = { bg = "none" },
				NormalNC = { bg = "none" },
				CursorLine = { bg = "none" },
				CursorColumn = { bg = "none" },
				ColorColumn = { bg = "none" },
				SignColumn = { bg = "none" },
				Folded = { bg = "none" },
				FoldColumn = { bg = "none" },
				DiagnosticVirtualTextError = { bg = "none" },
				DiagnosticVirtualTextWarn = { bg = "none" },
				DiagnosticVirtualTextInfo = { bg = "none" },
				DiagnosticVirtualTextHint = { bg = "none" },
				
				-- Telescope - Primeagen's favorite plugin
				TelescopeNormal = { bg = "none" },
				TelescopeBorder = { fg = "muted", bg = "none" },
				TelescopePromptNormal = { bg = "none" },
				TelescopePromptBorder = { fg = "muted", bg = "none" },
				TelescopeResultsNormal = { bg = "none" },
				TelescopeResultsBorder = { fg = "muted", bg = "none" },
				TelescopePreviewNormal = { bg = "none" },
				TelescopePreviewBorder = { fg = "muted", bg = "none" },
				
				-- Neo-tree transparency
				NeoTreeNormal = { bg = "none" },
				NeoTreeNormalNC = { bg = "none" },
				NeoTreeEndOfBuffer = { bg = "none" },
				
				-- Make sure everything is transparent
				EndOfBuffer = { bg = "none" },
				LineNr = { bg = "none" },
				CursorLineNr = { bg = "none" },
				StatusLine = { bg = "none" },
				StatusLineNC = { bg = "none" },
				TabLine = { bg = "none" },
				TabLineFill = { bg = "none" },
				TabLineSel = { bg = "none" },
				WinBar = { bg = "none" },
				WinBarNC = { bg = "none" },
			},
		})
		
		-- Set the colorscheme
		vim.cmd("colorscheme rose-pine")
	end,
}
