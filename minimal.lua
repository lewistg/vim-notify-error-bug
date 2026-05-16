-- Run this file as `nvim --clean -u minimal.lua`

for name, url in pairs {
  'https://github.com/lewistg/vim-notify-error-bug'
} do
  local install_path = vim.fn.fnamemodify('nvim_issue/' .. name, ':p')
  if vim.fn.isdirectory(install_path) == 0 then
    vim.fn.system { 'git', 'clone', '--depth=1', url, install_path }
  end
  vim.opt.runtimepath:append(install_path)
end

require("vim_notify_error_bug").run_job()
require("vim_notify_error_bug").wait_for_exit_code()
