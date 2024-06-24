---@type LazySpec
return {
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
  },
}
