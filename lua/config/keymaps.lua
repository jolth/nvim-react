--
-- KEYMAPS
-- ~/.config/nvim/lua/keymaps.lua
--

-- Variable local para facilitar la escritura (opcional)
local map = vim.keymap.set

-- Definir la tecla líder (usualmente Espacio)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- --- Atajos Generales ---

-- Guardar archivo con <Espacio>+w
map("n", "<leader>w", "<cmd>write<cr>", { desc = "Guardar archivo" })

-- Salir de Neovim con <Espacio>+q
map("n", "<leader>q", "<cmd>quit<cr>", { desc = "Salir" })
--map("n", "<Ctrl>q", "<cmd>quit<cr>", { desc = "Salir" })

-- Borrar palabra con Ctrl+w (estilo terminal)
vim.keymap.set("i", "<C-w>", "<C-o>db", { desc = "Borrar palabra" })

-- Centrar la pantalla en el cursor
vim.keymap.set("n", "<space>zz", "zz", { desc = "Centrar pantalla" })

-- Mover líneas con Alt+j/k
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Mover línea abajo" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Mover línea arriba" })

-- Borrar búsqueda resaltada con <Esc>
map("n", "<Esc>", "<cmd>noh<cr>", { desc = "Limpiar búsqueda" })

-- Mapear 'jk' a Escape en modo inserción y modo comando
vim.keymap.set({ "i", "c" }, "jk", "<Esc>", { desc = "Salir a modo normal" })

-- --- Atajos Específicos de Plugins (Ejemplo) ---
-- Si usas un plugin como telescope.nvim, puedes poner sus atajos aquí
-- o idealmente, en el archivo de configuración del propio plugin.   

-- nvim-tree.lua
-- Toggle NvimTree con <Leader> + e
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle Explorer" })
-- Buscar archivo actual en el árbol
vim.keymap.set("n", "<leader>E", ":NvimTreeFindFile<CR>", { desc = "Explorer Current File" })

-- Renombrado incremental con vista previa
vim.keymap.set("n", "<leader>rn", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true, desc = "Incremental Rename" })

-- Opcional: Mapeo manual si no aparece automático [Ayuda de Signaturas (LSP Signature)]
vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })
