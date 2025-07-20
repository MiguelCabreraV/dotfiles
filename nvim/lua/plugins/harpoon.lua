return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    local keymap = vim.keymap.set
    local list = harpoon:list()

    keymap("n", "<leader>a", function() harpoon:list():add() end)
    keymap("n", "<leader>m", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
  end,
}
