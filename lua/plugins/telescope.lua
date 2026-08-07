return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },

  -- 'keys' define los atajos que dispararán la carga del plugin
  keys = {
    -- Búsqueda de archivos (el más usado)
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Buscar archivos" },
  },

  -- La función config se ejecuta cuando el plugin se carga
  config = function()
    -- 1. Configuración del plugin (setup)
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        -- Tus opciones de configuración aquí
        file_ignore_patterns = { "node_modules" },
      },
    })

    -- 2. Definición de los atajos (Keymaps)
    -- Usamos una variable local 'map' para escribir menos (opcional)
    local map = vim.keymap.set

    -- Atajos específicos de Telescope (Los atajos adicionales que no disparan la carga van aquí)
    -- map("n", "<leader>ff", telescope.builtin.find_files, { desc = "Buscar archivos" })
    --map("n", "<leader>fg", telescope.builtin.live_grep, { desc = "Buscar texto" })
    --map("n", "<leader>fb", telescope.builtin.buffers, { desc = "Ver buffers" })
    --map("n", "<leader>fh", telescope.builtin.help_tags, { desc = "Ayuda" })

    -- Búsqueda de texto en todo el proyecto (Grep)
    map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Buscar texto" })
    -- Búsqueda de buffers abiertos
    map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Ver buffers" })

    -- Búsqueda de símbolos en el archivo actual (funciones, variables)
    map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "File Symbols" })
    -- Búsqueda de símbolos en todo el workspace
    map("n", "<leader>fS", "<cmd>Telescope lsp_workspace_symbols<cr>", { desc = "Workspace Symbols" })
    -- Historial de archivos recientes
    map("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Recent Files" })

    map("n", "<leader>fh", "<cmd>Telescope help_tags", { desc = "Ayuda" })
  end,
}
