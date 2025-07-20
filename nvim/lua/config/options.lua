local opt = vim.opt
local g = vim.g

vim.wo.number = true
opt.relativenumber = true

opt.statusline = "%f %y %m %= %l:%c %p%%"

opt.scrolloff = 4 -- Padding vertical
opt.sidescrolloff = 8 -- Padding horizontal
opt.splitbelow = true -- Splits horizontales debajo
opt.splitright = true -- Splits verticales a la derecha

opt.ignorecase = true -- Sin distinción de mayúsculas...
opt.smartcase = true -- ...excepto si usas mayúsculas

opt.termguicolors = true -- True color
vim.wo.signcolumn = "yes" -- Siempre visible

opt.mouse = "a" -- Mouse habilitado
opt.clipboard = "unnamedplus" -- Portapapeles compartido

opt.expandtab = true -- Tabs → espacios
opt.tabstop = 4 -- Visual width of tab
opt.softtabstop = 4 -- Insert spaces when pressing tab
opt.shiftwidth = 4 -- Indent width
opt.smartindent = true -- Auto-indent inteligente
opt.autoindent = true -- Copiar indent de la línea anterior

opt.completeopt = { "menuone", "noselect" } -- Menú de autocompletado limpio
opt.shortmess:append("c") -- Silencia mensajes redundantes

opt.undofile = true -- Persistencia del historial de undo
opt.swapfile = false
opt.backup = false
opt.writebackup = false

opt.updatetime = 250 -- Mejor para diagnóstico LSP
opt.timeoutlen = 300 -- Rápido para mappings

opt.wrap = false -- No wraps
opt.hlsearch = false -- No resaltar búsqueda
opt.showmode = false -- No mostrar -- INSERT --
opt.cmdheight = 1 -- Altura de la línea de comandos

opt.iskeyword:append("-") -- Palabras con guion (-)
opt.formatoptions:remove({ "c", "r", "o" }) -- Sin autocompletar comentarios

opt.list = false
opt.listchars = {}
