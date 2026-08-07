-- ~/.config/nvim/lua/plugins/treesitter.lua
--return {
--  {
--    "nvim-treesitter/nvim-treesitter",
--    build = ":TSUpdate",
--    config = function()
--      require("nvim-treesitter.configs").setup({
--        ensure_installed = { "javascript", "typescript", "tsx", "html", "css", "json" },
--        auto_install = true,
--        highlight = { enable = true },
--        indent = { enable = true },
--      })
--    end,
--  },
--}

--return {
--  "nvim-treesitter/nvim-treesitter",
--  build = ":TSUpdate",
--  config = function()
--    local configs = require("nvim-treesitter.configs")
--
--    configs.setup({
--      ensure_installed = { "javascript", "typescript", "tsx", "html", "css", "json", "lua" },
--      auto_install = true,
--      highlight = { enable = true },
--      indent = { enable = true },
--      -- Asegúrate de NO tener require('lspconfig') aquí dentro
--    })
--  end,
--}

return {
    {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false, -- Importante: cargar al inicio para que los parsers estén disponibles
  config = function()
    local treesitter = require("nvim-treesitter")

    -- 1. Instalar los parsers necesarios
    treesitter.setup({
      ensure_installed = { "javascript", "typescript", "tsx", "html", "css", "lua", "vim", "json" },
      auto_install = true,
    })

    -- 2. Habilitar resaltado e indentación manualmente (ya no se hace en setup)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "javascript", "typescript", "tsx", "html", "css", "lua", "vim", "json" },
      callback = function()
        -- Activar resaltado de sintaxis nativo de Neovim
        pcall(vim.treesitter.start)

        -- Activar indentación basada en treesitter
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
  },
  
    -- Plugin principal en rama master
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master", -- <--- CLAVE: Usar rama antigua
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "javascript", "typescript", "tsx", "html", "css", "lua", "vim" },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        -- Configuración de textobjects aquí
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
          move = {
            enable = true,
            goto_next_start = { ["]m"] = "@function.outer", ["]f"] = "@function.outer" },
            goto_previous_start = { ["[m"] = "@function.outer", ["[f"] = "@function.outer" },
          },
        },
      })
    end,
  },
  -- Plugin de textobjects también en rama master para compatibilidad
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "master", -- <--- CLAVE: Usar rama antigua
    config = function()
      -- La configuración real ya se hizo arriba en el bloque principal
      -- Este bloque solo asegura que se cargue
    end,
  },

}

