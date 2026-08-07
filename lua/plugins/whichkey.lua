-- ~/.config/nvim/lua/plugins/whichkey.lua
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = { spelling = true },
    defaults = {}, -- Aquí puedes agregar descripciones si no las pusiste en keymaps.lua
    win = {
      border = "rounded",
      padding = { 2, 2, 2, 2 },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    -- Registra tus atajos existentes para que aparezcan en el menú
    -- Si usaste 'desc' en vim.keymap.set (como te recomendé antes), 
    -- which-key los detectará automáticamente.
  end,
}
