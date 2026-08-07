-- ~/.config/nvim/lua/plugins/lsp.lua
--return {
--  {
--    "williamboman/mason.nvim",
--    build = ":MasonUpdate",
--    config = function()
--      require("mason").setup()
--    end,
--  },
--  {
--    "williamboman/mason-lspconfig.nvim",
--    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
--    config = function()
--      require("mason-lspconfig").setup({
--        ensure_installed = { "ts_ls", "cssls", "html", "lua_ls", },
--        automatic_installation = true,
--      })
--
--      local lspconfig = require("lspconfig")
--      
--      -- Configuración específica para TypeScript/JavaScript/React
--      lspconfig.ts_ls.setup({
--        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
--        init_options = {
--          preferences = {
--            disableSuggestions = false,
--          },
--        },
--      })
--
--      lspconfig.cssls.setup({})
--      lspconfig.html.setup({})
--    end,
--  },
--}

return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function() require("mason").setup() end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "ts_ls", "cssls", "html", "lua_ls" },
        automatic_installation = true,
      })

      -- CONFIGURACIÓN NATIVA NEOVIM 0.11+
      -- Esto reemplaza require('lspconfig').setup()
      --vim.lsp.config("ts_ls", {
      --  capabilities = require("cmp_nvim_lsp").default_capabilities(),
      --  on_attach = function(client, bufnr)
      --    -- Tus hooks de adjunción aquí
      --  end,
      --})

      vim.lsp.config("ts_ls", {
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
      on_attach = function(client, bufnr)
        -- 1. Función auxiliar para crear atajos solo en este buffer
        local nmap = function(keys, func, desc)
          if desc then
            desc = "LSP: " .. desc
          end
          vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
        end

        -- 2. Mapeos esenciales para desarrollo Web/TS
        nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")       -- Ir a la definición de una función/componente
        nmap("gr", vim.lsp.buf.references, "[G]oto [R]eferences")       -- Ver dónde se usa una variable
        nmap("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation") -- Ir a la implementación
        nmap("K", vim.lsp.buf.hover, "Hover Documentation")                  -- Ver documentación flotante (tipo JSDoc/TSDoc)
        nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation") -- Ver argumentos de la función mientras escribes
    
        -- Mapeos de refactorización (Crítico y muy útiles en TS/React)
        nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")     -- Renombrar variable/componente en todo el proyecto
        nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")  -- Arreglar errores, importar faltantes, extraer funciones
        nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition") -- Ir a la definición del tipo (interface/type)
        nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
        nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
    
        -- 3. Ejemplo específico para TypeScript (si usas nvim-lsp-ts-utils)
        -- if client.name == "ts_ls" then
        --   require("nvim-lsp-ts-utils").setup_client(client)
        --   require("nvim-lsp-ts-utils").setup({
        --     enable_import_on_completion = true,
        --   })
        -- end
    
        -- 4. Notificación opcional (puedes borrarla si es molesta)
        -- vim.notify("LSP TypeScript activado para: " .. vim.fn.expand("%:t"), vim.log.levels.INFO)
      end,
    })


      vim.lsp.config("cssls", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      vim.lsp.config("html", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      vim.lsp.config("lua_ls", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })
    end,
  },
}
