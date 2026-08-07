-- ~/.config/nvim/lua/plugins/statusline.lua
return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- Necesario para los iconos de archivos (React, TS, etc.)
    event = "VeryLazy", -- Carga diferida para no ralentizar el inicio
    config = function()
        require("lualine").setup({
            options = {
                theme = "auto", -- Usa el tema de tu colorscheme actual
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                disabled_filetypes = { "lazy", "mason" }, -- Ocultar en ventanas de gestión
                globalstatus = true, -- Barra de estado global (estilo VS Code)
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" }, -- Diagnósticos de ESLint/TS aquí
                lualine_c = { "filename" },
                lualine_x = { { "lsp", icon = "" }, -- Muestra el icono y nombre del LSP activo
                "encoding", 
                "fileformat", 
                "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
            integrations = {
                -- ... otras integraciones ...
                gitsigns = true, -- <--- Esta línea activa la barra de estado
                -- ...
            }
        })
    end,
}
