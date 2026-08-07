-- ~/.config/nvim/lua/plugins/bufferline.lua
return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local bufferline = require("bufferline")

    bufferline.setup({
      options = {
        mode = "buffers", -- 'buffers' (todos los buffers) o 'tabs' (solo pestañas)
        style_preset = bufferline.style_preset.default, -- o 'minimal', 'no_bold', etc.
        themable = true,
        numbers = "none", -- 'ordinal' | 'buffer_id' | 'both' | function
        close_command = "bdelete! %d", -- Comando al hacer clic en 'x'
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        indicator = {
          icon = "▎", -- Icono para el buffer seleccionado
          style = "icon",
        },
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 18,
        max_prefix_length = 15,
        truncate_names = true,
        tab_size = 18,
        diagnostics = "nvim_lsp", -- Muestra errores de LSP (TS/ESLint) en la pestaña
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local icon = level:match("error") and "  " or "  "
          return " " .. icon .. count
        end,
        offsets = {
          {
            filetype = "NvimTree",
            text = "Explorador",
            highlight = "Directory",
            text_align = "left",
            separator = true,
          },
        },
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        separator_style = "slant", -- 'slant', 'slope', 'thick', 'thin'
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        hover = {
          enabled = true,
          delay = 200,
          reveal = { "close" },
        },
        sort_by = "insert_after_current", -- 'insert_after_current', 'id', 'extension', etc.
      },
      highlights = {
        -- Aquí puedes sobrescribir colores si tu tema (Catppuccin) no lo hace automáticamente
        -- Generalmente no es necesario con temas modernos
      },
    })

    -- Mapeos de Teclado Esenciales
    local keymap = vim.keymap.set
    
    -- Navegación entre buffers
    keymap("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Buffer Anterior" })
    keymap("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Buffer Siguiente" })
    
    -- Cerrar buffers
    keymap("n", "<leader>bc", "<cmd>BufferLineCloseCurrent<cr>", { desc = "Cerrar buffer actual" })
    keymap("n", "<leader>bC", "<cmd>BufferLineCloseOthers<cr>", { desc = "Cerrar otros buffers" })
    keymap("n", "<leader>br", "<cmd>BufferLineCloseRight<cr>", { desc = "cerrar buffers a la derecha" })
    keymap("n", "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", { desc = "cerrar buffers a la izquierda" })
    
    -- Mover buffers (reordenar)
    keymap("n", "<leader>bp", "<cmd>BufferLineTogglePin<cr>", { desc = "Fijar buffer (Pin)" })
    keymap("n", "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<cr>", { desc = "Cerrar no fijados" })
    keymap("n", "<S-H>", "<cmd>BufferLineMovePrev<cr>", { desc = "Mover buffer izquierda" })
    keymap("n", "<S-L>", "<cmd>BufferLineMoveNext<cr>", { desc = "Mover buffer derecha" })
    
    -- Saltar a un buffer específico (1-9)
    keymap("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>", { desc = "Ir al buffer 1" })
    keymap("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>", { desc = "Ir al buffer 2" })
    keymap("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>", { desc = "Ir al buffer 3" })
    keymap("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>", { desc = "Ir al buffer 4" })
    keymap("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>", { desc = "Ir al buffer 5" })
  end,
}
