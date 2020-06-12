local M = {}

local function process(imap_account)
  print(imap_account)
end

-- export command() function and configurable temporary "input" file
M.process = process

return M

