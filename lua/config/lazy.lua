-- ~/.config/nvim/lua/config/lazy.lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- Carga todos los archivos .lua dentro de la carpeta lua/plugins/
require("lazy").setup({
  spec = {
    { import = "plugins" }, -- Importa automáticamente todos los archivos en lua/plugins
  },
  defaults = {
    lazy = false, -- Los plugins se cargan bajo demanda por defecto
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true }, -- Verifica actualizaciones automáticamente
})
