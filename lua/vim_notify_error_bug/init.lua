local M = {}

M.exit_code = nil

function M.run_job()
  vim.fn.jobstart('exit 1', {
    on_exit = function(_, exit_code)
      M.exit_code = exit_code
      vim.schedule(function()
        vim.notify('Exit code: ' .. exit_code, vim.log.levels.ERROR)
      end)
    end,
  })
end

function M.wait_for_exit_code()
  vim.fn.wait(1000, function()
    return M.exit_code ~= nil
  end)
  vim.notify('Exit code: ' .. M.exit_code, vim.log.levels.INFO)
end

return M
