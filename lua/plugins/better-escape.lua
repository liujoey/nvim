---@type LazySpec
return {
  {
    "max397574/better-escape.nvim",
    opts = {
      default_mappings = false,
      mappings = {
        i = {
          [","] = {
            -- These can all also be functions
            h = "<Esc>",
          },
        },
        c = {
          [","] = {
            h = "<Esc>",
          },
        },
        t = {
          [","] = {
            h = "<Esc>",
          },
        },
        v = {
          [","] = {
            h = "<Esc>",
          },
        },
        s = {
          [","] = {
            h = "<Esc>",
          },
        },
      },
    },
  },
}
