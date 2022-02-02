local M = {}

M.defaults = {
  [[
  function! QuickFixToggle()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
      copen
    else
      cclose
    endif
  endfunction
  ]],
  -- :LvimInfo
  [[ command! Info lua require('core.info').toggle_popup(vim.bo.filetype) ]],
  [[ command! CacheReset lua require('utils.hooks').reset_cache() ]],
  [[ command! SyncCorePlugins lua require('plugin-loader'):sync_core_plugins() ]],
  [[ command! Reload lua require('config'):reload() ]],
  [[ command! ToggleFormatOnSave lua require('core.autocmds').toggle_format_on_save() ]],
  [[ command! Version lua require('core.telescope.custom-finders').view_lunarvim_changelog() ]],
}

M.load = function(commands)
  for _, command in ipairs(commands) do
    vim.cmd(command)
  end
end

return M
