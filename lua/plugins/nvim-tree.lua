-- ~/.config/nvim/lua/plugins/nvim-tree.lua
return {
  "nvim-tree/nvim-tree.lua",
  version = "*", -- Usar última versión estable
  lazy = false,  -- Cargar al inicio para disponibilidad inmediata
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- Iconos de archivos (requiere fuente Nerd Font)
  },
  config = function()
    local api = require("nvim-tree.api")

    -- Función auxiliar para definir atajos solo en el buffer del árbol
    local function my_on_attach(bufnr)
      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- Mapeos por defecto (recomendado mantenerlos)
      api.config.mappings.default_on_attach(bufnr)

      -- Mapeos personalizados adicionales
      vim.keymap.set("n", "l", api.node.open.edit, opts("Abrir"))
      vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Cerrar carpeta"))
      vim.keymap.set("n", "v", api.node.open.vertical, opts("Abrir en división vertical"))
      vim.keymap.set("n", "<C-r>", api.fs.rename_sub, opts("Renombrar (omitir extensión)"))
    end

    require("nvim-tree").setup({
      on_attach = my_on_attach,
      disable_netrw = true,
      hijack_netrw = true,
      open_on_tab = false,
      sort_by = "case_sensitive",
      view = {
        width = 55,
        side = "left",
        preserve_window_proportions = false,
        signcolumn = "yes",
        number = false,
        relativenumber = false,
      },
      renderer = {
        group_empty = true, -- Agrupa carpetas vacías
        highlight_git = true,
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
          glyphs = {
            default = "",
            symlink = "",
            folder = {
              arrow_open = "",
              arrow_closed = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "",
              staged = "S",
              unmerged = "",
              renamed = "➜",
              untracked = "U",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
      diagnostics = {
        enable = true, -- Muestra errores de ESLint/TS en el árbol
        show_on_dirs = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      filters = {
        dotfiles = false, -- Mostrar archivos ocultos (.gitignore, .env)
        git_ignored = false,
      },
      git = {
        enable = true,
        ignore = false,
        timeout = 500,
      },
      actions = {
        open_file = {
          quit_on_open = false, -- No cerrar el árbol al abrir un archivo
          resize_window = true,
        },
      },
    })
  end,
}
