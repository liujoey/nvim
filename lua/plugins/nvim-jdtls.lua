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
      local root_markers = { ".git", "mvnw", "gradlew", "build.gradle" }
      local root_dir = require("jdtls.setup").find_root(root_markers)
      local utils = require "astrocore"
      return utils.extend_tbl(opts, {
        root_dir = root_dir,
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
      })
    end,
  },
}
