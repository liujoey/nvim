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
}
