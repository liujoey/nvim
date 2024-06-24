---@type LazySpec
return {
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
}
