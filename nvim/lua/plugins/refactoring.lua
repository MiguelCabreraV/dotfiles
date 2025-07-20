return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" }, -- Requerido
    { "nvim-treesitter/nvim-treesitter" }, -- Requiere Treesitter para parseo de código
  },
  config = function()
    require("refactoring").setup({
      prompt_func_return_type = {
        go = true,
        java = true,
        cpp = true,
        c = true,
        typescript = true,
      },
      prompt_func_param_type = {
        go = true,
        java = true,
        cpp = true,
        c = true,
        typescript = true,
      },
    })

    -- Atajos prácticos como usa Prime
    vim.keymap.set("x", "<leader>re", function()
      require("refactoring").refactor("Extract Function")
    end, { desc = "Extract Function", noremap = true, silent = true })

    vim.keymap.set("x", "<leader>rf", function()
      require("refactoring").refactor("Extract Function To File")
    end, { desc = "Extract Function to File", noremap = true, silent = true })

    vim.keymap.set("x", "<leader>rv", function()
      require("refactoring").refactor("Extract Variable")
    end, { desc = "Extract Variable", noremap = true, silent = true })

    vim.keymap.set({ "n", "x" }, "<leader>ri", function()
      require("refactoring").refactor("Inline Variable")
    end, { desc = "Inline Variable", noremap = true, silent = true })

    vim.keymap.set("n", "<leader>rb", function()
      require("refactoring").refactor("Extract Block")
    end, { desc = "Extract Block", noremap = true, silent = true })

    vim.keymap.set("n", "<leader>rB", function()
      require("refactoring").refactor("Extract Block To File")
    end, { desc = "Extract Block to File", noremap = true, silent = true })
  end,
}
