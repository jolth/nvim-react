-- ~/.config/nvim/lua/plugins/cmp.lua
return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            --cmp.setup({
            --  snippet = {
            --    expand = function(args)
            --      luasnip.lsp_expand(args.body)
            --    end,
            --  },
            --  mapping = cmp.mapping.preset.insert({
            --    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            --    ["<C-f>"] = cmp.mapping.scroll_docs(4),
            --    ["<C-Space>"] = cmp.mapping.complete(),
            --    ["<CR>"] = cmp.mapping.confirm({ select = true }),
            --  }),

            --  sources = cmp.config.sources({
            --    { name = "nvim_lsp" }, -- Prioriza sugerencias del LSP (TypeScript)
            --    { name = "luasnip" },
            --    { name = "buffer" },
            --  }),
            --})
            --


            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),

                    -- Navegación en la lista de sugerencias
                    ["<C-j>"] = cmp.mapping.select_next_item(),   -- Siguiente sugerencia
                    ["<C-k>"] = cmp.mapping.select_prev_item(),   -- Sugerencia anterior

                    -- Confirmar selección (Enter)
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),

                    -- Abrir menú manualmente si se cierra
                    ["<C-Space>"] = cmp.mapping.complete(),

                    -- Cancelar autocompletado
                    -- Cancelar con Escape
                    ["<Esc>"] = cmp.mapping.abort(),
                    ["<C-e>"] = cmp.mapping.abort(),

                    -- Saltar entre placeholders en snippets (ej. después de escribir 'rfce' para un componente React)
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    -- Navegación con Tab / Shift-Tab
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif require("luasnip").expand_or_jumpable() then
                            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif require("luasnip").jumpable(-1) then
                        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                sources = cmp.config.sources({
                    { name = "nvim_lsp" }, -- Prioriza sugerencias del LSP (TypeScript)
                    { name = "luasnip" },
                    { name = "buffer" },
                }),
            })

        end,
    },
}
