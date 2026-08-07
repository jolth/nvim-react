-- ~/.config/nvim/lua/plugins/formatting.lua
return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    config = function()
      local conform = require("conform")
      
      conform.setup({
        formatters_by_ft = {
          javascript = { "prettierd", "prettier", stop_after_first = true },
          typescript = { "prettierd", "prettier", stop_after_first = true },
          javascriptreact = { "prettierd", "prettier", stop_after_first = true },
          typescriptreact = { "prettierd", "prettier", stop_after_first = true },
          css = { "prettierd", "prettier", stop_after_first = true },
          html = { "prettierd", "prettier", stop_after_first = true },
          json = { "prettierd", "prettier", stop_after_first = true },
        },
        -- Formatear automáticamente al guardar
        format_on_save = {
          lsp_fallback = true, -- Usar LSP si no hay formatter externo
          async = false,       -- Esperar a que termine para guardar
          timeout_ms = 500,    -- Límite de tiempo
        },
      })

      -- Mapeo manual para formatear (usa tu <leader>, ej. <leader>mf)
      vim.keymap.set({ "n", "v" }, "<leader>mf", function()
        conform.format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        })
      end, { desc = "Format buffer" })
    end,
  },
  --{
  --  "stevearc/conform.nvim",
  --  event = { "BufWritePre" },
  --  config = function()
  --    local conform = require("conform")
  --    conform.setup({
  --      formatters_by_ft = {
  --        javascript = { "prettier" },
  --        typescript = { "prettier" },
  --        javascriptreact = { "prettier" },
  --        typescriptreact = { "prettier" },
  --        css = { "prettier" },
  --        html = { "prettier" },
  --      },
  --      format_on_save = { lsp_fallback = true, async = false, timeout_ms = 500 },
  --    })
  --  end,
  --},
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufWritePost" },
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
      }
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function() lint.try_lint() end,
      })
    end,
  },
}
