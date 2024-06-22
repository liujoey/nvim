---@type LazySpec
return {
  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        [[                                                                       ]],
        [[                                                                     ]],
        [[       ████ ██████           █████      ██                     ]],
        [[      ███████████             █████                             ]],
        [[      █████████ ███████████████████ ███   ███████████   ]],
        [[     █████████  ███    █████████████ █████ ██████████████   ]],
        [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
        [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
        [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
        [[                                                                       ]],
      }
      -- return opts
    end,
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      transparent_background = true,
    },
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
    },
  },
  {
    "max397574/better-escape.nvim",
    opts = { mapping = { ",h" } },
  },
  {
    "kevinhwang91/nvim-bqf",
    opts = {
      preview = {
        winblend = 0,
      },
    },
  },
  {
    "kevinhwang91/nvim-ufo",
    opts = {
      preview = {
        win_config = {
          winblend = 0
        }
      }
    }
  },
  {
    "tpope/vim-rsi",
    event = "InsertEnter",
  },
  {
    "tpope/vim-repeat",
    event = "InsertEnter",
  },
  {
    "mfussenegger/nvim-jdtls",
    dependencies = {
      {
        "AstroNvim/astrolsp",
        opts = {
          mappings = {
            n = {
              ["<leader>lo"] = {
                function() require'jdtls'.organize_imports() end,
                desc = "Organize Imports"
              },
            },
          },
        },
      },
    },
    opts = function(_, opts)
      local utils = require "astrocore"
      return utils.extend_tbl({
        settings = {
          java = {
            completion = {
              importOrder = {
                "#",
                "java",
                "javax",
                "oracle.kv",
                "oracle.nosql",
                "com",
                "org",
              },
            },
          },
        },
      }, opts)
    end,
  },
  {
    "nvim-neorg/neorg",
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = {
          autocmds = {
            norg_conceals = {
              {
                event = "FileType",
                pattern = "norg",
                callback = function ()
                  vim.opt_local.conceallevel = 2
                  vim.opt_local.concealcursor = "nv"
                end,
              },
            },
          },
        },
      },
    },
    lazy = false,
    opts = {
      load = {
        ["core.concealer"] = {
          config = {
            icon_preset = "diamond",
          },
        },
      },
    },
    -- config = true,
  },
}
