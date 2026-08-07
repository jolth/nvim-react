-- ~/.config/nvim/lua/plugins/cheatsheet.lua
return {
  "sudormrfbin/cheatsheet.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("cheatsheet").setup({
      bundled_cheatsheets = true,
      bundled_plugin_cheatsheets = true,
      include_only_installed_plugins = true,
      telescope_mappings = {
        ["<CR>"] = require("cheatsheet.telescope.actions").select_or_fill_commandline,
        ["<C-Y>"] = require("cheatsheet.telescope.actions").copy_cheat_value,
      },
    })
  end,
  keys = {
    { "<leader>??", "<cmd>Cheatsheet<CR>", desc = "Buscar en Cheatsheet" },
  },
}
