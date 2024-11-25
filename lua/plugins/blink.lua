return {
  "Saghen/blink.cmp",
  opts = {
    trigger = {
      completion = { blocked_trigger_characters = { ' ', ',', '\n', '\t' }, },
      signature_help = { enabled = true },
    },
  },
  specs = {
    { "onsails/lspkind.nvim", enabled = true },
  }
}
