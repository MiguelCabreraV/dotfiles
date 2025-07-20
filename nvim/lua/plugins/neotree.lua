return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		close_if_last_window = false,
		popup_border_style = "rounded",
		enable_git_status = true,
		enable_diagnostics = false,
		
		default_component_configs = {
			container = {
				enable_character_fade = false,
			},
			indent = {
				indent_size = 2,
				padding = 1,
				with_markers = true,
				indent_marker = "│",
				last_indent_marker = "└",
				with_expanders = nil,
				expander_collapsed = "",
				expander_expanded = "",
			},
			icon = {
				folder_closed = "",
				folder_open = "",
				folder_empty = "ﰊ",
				-- No file icons - Primeagen style
				default = "",
				highlight = "NeoTreeFileIcon",
			},
			modified = {
				symbol = "[+]",
				highlight = "NeoTreeModified",
			},
			name = {
				trailing_slash = false,
				use_git_status_colors = true,
				highlight = "NeoTreeFileName",
			},
			git_status = {
				symbols = {
					-- Simple symbols - Primeagen style
					added = "+",
					modified = "~",
					deleted = "-",
					renamed = "r",
					untracked = "?",
					ignored = "!",
					unstaged = "u",
					staged = "s",
					conflict = "!",
				},
			},
		},
		
		window = {
			position = "right",
			width = 30, -- Narrower - Primeagen efficiency
			mapping_options = {
				noremap = true,
				nowait = true,
			},
			mappings = {
				["<space>"] = "toggle_node",
				["<cr>"] = "open",
				["<esc>"] = "cancel",
				["P"] = "toggle_preview",
				["l"] = "focus_preview",
				["S"] = "open_split",
				["s"] = "open_vsplit",
				["t"] = "open_tabnew",
				["C"] = "close_node",
				["z"] = "close_all_nodes",
				["a"] = "add",
				["A"] = "add_directory",
				["d"] = "delete",
				["r"] = "rename",
				["y"] = "copy_to_clipboard",
				["x"] = "cut_to_clipboard",
				["p"] = "paste_from_clipboard",
				["c"] = "copy",
				["m"] = "move",
				["q"] = "close_window",
				["R"] = "refresh",
				["?"] = "show_help",
				-- Disable Y to avoid conflicts with Primeagen yank
				["Y"] = "none",
			},
		},
		
		filesystem = {
			filtered_items = {
				visible = false,
				hide_dotfiles = false, -- Primeagen shows dotfiles
				hide_gitignored = false,
				hide_hidden = true,
				hide_by_name = {
					".git",
					".DS_Store",
					"node_modules", -- Primeagen hates node_modules clutter
				},
				always_show = {
					".env",
					".gitignore",
					".nvim.lua",
				},
				never_show = {
					".DS_Store",
					"thumbs.db",
				},
			},
			follow_current_file = {
				enabled = false, -- Primeagen doesn't like auto-following
				leave_dirs_open = false,
			},
			group_empty_dirs = false,
			hijack_netrw_behavior = "open_default",
			use_libuv_file_watcher = false, -- Keep it simple
			window = {
				mappings = {
					["<bs>"] = "navigate_up",
					["."] = "set_root",
					["H"] = "toggle_hidden",
					["/"] = "fuzzy_finder",
					["f"] = "filter_on_submit",
					["<c-x>"] = "clear_filter",
					-- Simple navigation - Primeagen style
					["[g"] = "prev_git_modified",
					["]g"] = "next_git_modified",
				},
			},
		},
		
		buffers = {
			follow_current_file = {
				enabled = false, -- Primeagen controls his own navigation
				leave_dirs_open = false,
			},
			group_empty_dirs = true,
			show_unloaded = false, -- Less visual clutter
			window = {
				mappings = {
					["bd"] = "buffer_delete",
					["<bs>"] = "navigate_up",
					["."] = "set_root",
				},
			},
		},
		
		git_status = {
			window = {
				position = "float",
				mappings = {
					["A"] = "git_add_all",
					["gu"] = "git_unstage_file",
					["ga"] = "git_add_file",
					["gr"] = "git_revert_file",
					["gc"] = "git_commit",
					["gp"] = "git_push",
				},
			},
		},
	},
	
	config = function(_, opts)
		-- Disable nvim-web-devicons to remove file icons
		vim.g.neo_tree_remove_legacy_commands = 1
		
		require("neo-tree").setup(opts)
		
		-- Primeagen-style keymaps - simple and efficient
		vim.keymap.set("n", "<leader>pv", function()
			vim.cmd("Neotree toggle right")
		end, { desc = "Project view (Neo-tree)" })
		
		-- Optional: reveal current file (but not auto-follow)
		vim.keymap.set("n", "<leader>pf", function()
			vim.cmd("Neotree reveal")
		end, { desc = "Project find current file" })
	end,
}
