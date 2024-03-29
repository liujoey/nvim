require "core"

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").lazy(lazypath)
end

vim.opt.rtp:prepend(lazypath)
require "plugins"
vim.schedule(function ()
  dofile(vim.g.base46_cache .. "defaults")
  dofile(vim.g.base46_cache .. "git")
end)
