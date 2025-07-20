-- lua/config/commenter.lua
return {
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup({
			padding = true,
			sticky = true,
			toggler = {
				line = "ku", -- comentar/descomentar línea con ku
				block = "kc", -- comentar/descomentar bloque con kc
			},
			opleader = {
				line = "ku", -- operador para línea
				block = "kc", -- operador para bloque
			},
			mappings = {
				basic = true,
				extra = false,
			},
			pre_hook = nil,
			post_hook = nil,
		})
	end,
}
