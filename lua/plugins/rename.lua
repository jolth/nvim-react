-- ~/.config/nvim/lua/plugins/rename.lua
return {
  "smjonas/inc-rename.nvim",
  config = function()
    require("inc_rename").setup({
      cmd_name = "IncRename", -- Nombre del comando
      hl_group = "Substitute", -- Grupo de resaltado para la vista previa
      preview_empty_name = false,
      show_message = true, -- Mensaje tras renombrar
      -- Integración con dressing.nvim si lo usas para inputs bonitos
      input_buffer_type = "dressing", 
    })
  end,
}
