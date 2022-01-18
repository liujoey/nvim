local M = {}

local builtins = {
  "core.which-key",
  "core.gitsigns",
  "core.cmp",
  "core.terminal",
  "core.telescope",
  "core.treesitter",
  "core.nvimtree",
  "core.bufferline",
  "core.autopairs",
  "core.comment",
  "core.notify",
  "core.lualine",
}

function M.config(config)
  for _, builtin_path in ipairs(builtins) do
    local builtin = require(builtin_path)
    builtin.config(config)
  end
end

return M
