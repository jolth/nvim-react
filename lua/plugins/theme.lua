-- ~/.config/nvim/lua/plugins/theme.lua
return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,        -- Cargar antes que nada
  lazy = false,           -- No cargar bajo demanda
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",      -- Opciones: latte, frappe, macchiato, mocha
      background = {          -- Configuración de fondo
        light = "latte",
        dark = "mocha",
      },
      transparent_background = false, -- true para fondo transparente
      show_end_of_buffer = false,     -- Muestra caracteres ~ al final del buffer
      term_colors = false,            -- Colores de terminal
      dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
      },
      no_italic = false,              -- Forzar sin cursivas
      no_bold = false,                -- Forzar sin negritas
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = { "italic" },
        keywords = { "italic" },
        strings = {},
        variables = {},
        numbers = {},
      },
      -- Integraciones críticas para desarrollo Web
      integrations = {
        cmp = true,                   -- Autocompletado (nvim-cmp)
        gitsigns = true,              -- Git signs
        nvimtree = true,              -- Explorador de archivos
        treesitter = true,            -- Resaltado de sintaxis (JS/TS/React)
        telescope = { enabled = true }, -- Búsqueda difusa
        which_key = true,             -- Menú de atajos
        indent_blankline = { enabled = true }, -- Guías de indentación
        mini = true,                  -- Suite de plugins mini.nvim
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
        },
        lsp_trouble = true,
        notify = true,
      },
    })
    -- Aplicar el tema
    vim.cmd.colorscheme("catppuccin")
  end,
}
