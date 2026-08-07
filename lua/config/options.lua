-- Opciones Base
vim.opt.number = true              -- Mostrar números de línea
vim.opt.relativenumber = true      -- Números relativos
vim.opt.tabstop = 2                -- Tabs de 2 espacios
vim.opt.shiftwidth = 2             -- Tamaño de la indentación automática 
vim.opt.expandtab = true           -- Usar espacios en lugar de tabuladores
vim.opt.smartindent = true         -- Auto-indentar
vim.opt.termguicolors = true       -- Colores reales en terminal
vim.opt.smartcase = true           -- Búsqueda inteligente (mayúsculas/minúsculas)
--vim.opt.wrap = false               -- No ajustar líneas largas

-- Deshabilitar netrw (explorador nativo) para evitar conflictos con nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Configuración de ventana flotante para signaturas
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = "rounded",
    close_events = { "CursorMoved", "BufHidden", "InsertCharPre" },
  }
)

