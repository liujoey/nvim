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
    "max397574/better-escape.nvim",
    opts = { mapping = { ",h" } },
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
                  vim.opt_local.wrap = true
                  vim.opt_local.spell = true
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
  {
    "abecodes/tabout.nvim",
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            i = {
              ["<C-l>"] = { "<Plug>(TaboutMulti)", desc = "TaboutMulti" },
            }
          },
        },
      },
    },
  },
}
