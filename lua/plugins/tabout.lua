---@type LazySpec
return {
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
