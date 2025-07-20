-- Set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ========================================
-- FILE MANAGEMENT
-- ========================================
keymap("n", "<C-s>", "<cmd>w<CR>", opts) -- Save file
keymap("n", "<C-q>", "<cmd>q<CR>", opts) -- Quit file

-- ========================================
-- EDITING BEHAVIOR
-- ========================================
keymap("n", "x", '"_x', opts) -- Delete character without copying into register

-- Yank to system clipboard (Primeagen style)
keymap({ "n", "v" }, "<leader>y", '"+y', opts)
keymap("n", "<leader>Y", '"+Y', opts)

-- Paste without losing register in visual mode
keymap("x", "<leader>p", '"_dP', opts)

-- Clear search highlights
keymap("n", "<leader>nh", ":nohl<CR>", opts)

-- Join lines but keep cursor in place
keymap("n", "J", "mzJ`z", opts)

-- Move selected lines up/down in visual mode
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- ========================================
-- MOVEMENT / SCROLLING
-- ========================================
-- Vertical scroll with screen centering
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Keep cursor centered on search
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Move to visual line start/end
keymap("n", "H", "^", opts) -- Beginning of line
keymap("n", "L", "g_", opts) -- End of line

-- Navigate windows with Ctrl + hjkl
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- ========================================
-- WINDOW MANAGEMENT
-- ========================================
keymap("n", "<leader>v", "<C-w>v", opts) -- Vertical split
keymap("n", "<leader>h", "<C-w>s", opts) -- Horizontal split
keymap("n", "<leader>se", "<C-w>=", opts) -- Equalize split sizes
keymap("n", "<leader>xs", ":close<CR>", opts) -- Close current split

-- Resize windows with arrow keys
keymap("n", "<Up>", ":resize -2<CR>", opts)
keymap("n", "<Down>", ":resize +2<CR>", opts)
keymap("n", "<Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<Right>", ":vertical resize +2<CR>", opts)

-- Buffer navigation
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)
keymap("n", "<leader>x", ":bdelete!<CR>", opts) -- close buffer
keymap("n", "<leader>b", "<cmd> enew <CR>", opts) -- new buffer

-- ========================================
-- PRIMEAGEN EXTRAS
-- ========================================
-- Delete to void register
keymap({ "n", "v" }, "<leader>d", '"_d', opts)

-- Replace word under cursor globally
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)

-- Make current file executable
keymap("n", "<leader>mx", "<cmd>!chmod +x %<CR>", { silent = true })

keymap("n", "<leader>te", ":terminal<CR>i", opts)

-- Quick fix navigation
keymap("n", "<C-k>", "<cmd>cnext<CR>zz", opts)
keymap("n", "<C-j>", "<cmd>cprev<CR>zz", opts)
keymap("n", "<leader>k", "<cmd>lnext<CR>zz", opts)
keymap("n", "<leader>j", "<cmd>lprev<CR>zz", opts)

-- ========================================
-- DIAGNOSTICS
-- ========================================
keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
keymap("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
keymap("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

keymap("n", "<leader>f", function()
	require("conform").format({ lsp_fallback = true })
end, vim.tbl_extend("force", opts, { desc = "Format buffer with Conform" }))

vim.api.nvim_create_autocmd(
	"LspAttach",
	{ --  Use LspAttach autocommand to only map the following keys after the language server attaches to the current buffer
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(ev)
			vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc" -- Enable completion triggered by <c-x><c-o>

			-- Buffer local mappings.
			-- See `:help vim.lsp.*` for documentation on any of the below functions
			local opts = { buffer = ev.buf }
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "<leader><space>", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

			vim.keymap.set("n", "<leader>f", function()
				vim.lsp.buf.format({ async = true })
			end, opts)

			-- Open the diagnostic under the cursor in a float window
			vim.keymap.set("n", "<leader>d", function()
				vim.diagnostic.open_float({
					border = "rounded",
				})
			end, opts)
		end,
	}
)
