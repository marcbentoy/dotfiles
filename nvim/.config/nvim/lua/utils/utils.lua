local M = {}

M.safe_bdelete = function()
  local buffers = vim.fn.getbufinfo({ buflisted = 1 })
  if #buffers > 1 then
    vim.cmd("bdelete")
  else
    vim.cmd("enew") -- Open a new empty buffer
    vim.cmd("bdelete") -- Close the current buffer
  end
end

return M
