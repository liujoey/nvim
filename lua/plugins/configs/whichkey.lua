local options = {

  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "  ", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },

  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },

  window = {
    border = "none", -- none/single/double/shadow
  },

  layout = {
    spacing = 6, -- spacing between columns
  },

  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },

  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    i = { "j", "k" },
    v = { "j", "k" },
  },

  defaults = {
    mode = { "n", "v" },
    ["f"] = {
      name = "file/find",
    },
    ["b"] = {
      name = "buffer",
    },
    ["c"] = {
      name = "code",
    },
    ["g"] = {
      name = "git",
    },
    ["s"] = {
      name = "search",
    },
    ["u"] = {
      name = "UI",
    },
    ["x"] = {
      name = "diagnostics/quickfix",
    }
  }
}

return options
