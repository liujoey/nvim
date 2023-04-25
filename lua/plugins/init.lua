-- All plugins have lazy=true by default,to load a plugin on startup just lazy=false
-- List of all default plugins & their definitions
local plugins = {

  "nvim-lua/plenary.nvim",

  { import = "plugins.ui" },

  { import = "plugins.core" },

  { import = "plugins.git" },

  { import = "plugins.lsp" },

  { import = "plugins.coding" },

  { import = "plugins.editing" },

  { import = "plugins.lang.java" },

  -- Only load whichkey after all the gui
  {
    "folke/which-key.nvim",
    keys = { "<leader>", '"', "'", "`", "c", "v" },
    opts = function()
      return require "plugins.configs.whichkey"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "whichkey")
      local wk = require("which-key")
      wk.setup(opts)
      wk.register(opts.defaults, { prefix = "<leader>"})
    end,
  },
}

local config = require("core.utils").load_config()

require("lazy").setup(plugins, config.lazy_nvim)
