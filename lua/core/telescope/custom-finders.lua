local M = {}

local _, builtin = pcall(require, "telescope.builtin")
local _, finders = pcall(require, "telescope.finders")
local _, pickers = pcall(require, "telescope.pickers")
local _, sorters = pcall(require, "telescope.sorters")
local _, themes = pcall(require, "telescope.themes")
local _, actions = pcall(require, "telescope.actions")
local _, previewers = pcall(require, "telescope.previewers")
local _, make_entry = pcall(require, "telescope.make_entry")

function M.find_neovim_files(opts)
  opts = opts or {}
  local theme_opts = themes.get_ivy {
    sorting_strategy = "ascending",
    layout_strategy = "bottom_pane",
    prompt_prefix = ">> ",
    prompt_title = "~ NeoVim files ~",
    cwd = get_runtime_dir(),
    search_dirs = { get_config_dir(), lvim.lsp.templates_dir },
  }
  opts = vim.tbl_deep_extend("force", theme_opts, opts)
  builtin.find_files(opts)
end

function M.grep_neovim_files(opts)
  opts = opts or {}
  local theme_opts = themes.get_ivy {
    sorting_strategy = "ascending",
    layout_strategy = "bottom_pane",
    prompt_prefix = ">> ",
    prompt_title = "~ search NeoVim ~",
    cwd = get_runtime_dir(),
    search_dirs = { get_config_dir(), lvim.lsp.templates_dir },
  }
  opts = vim.tbl_deep_extend("force", theme_opts, opts)
  builtin.live_grep(opts)
end

local copy_to_clipboard_action = function(prompt_bufnr)
  local _, action_state = pcall(require, "telescope.actions.state")
  local entry = action_state.get_selected_entry()
  local version = entry.value
  vim.fn.setreg("+", version)
  vim.fn.setreg('"', version)
  vim.notify("Copied " .. version .. " to clipboard", vim.log.levels.INFO)
  actions.close(prompt_bufnr)
end

-- Smartly opens either git_files or find_files, depending on whether the working directory is
-- contained in a Git repo.
function M.find_project_files()
  local ok = pcall(builtin.git_files)

  if not ok then
    builtin.find_files()
  end
end

return M
