package.path = package.path .. ';/root/imap_config/?.lua'
local config = require "imap_account_config"
local sh = require 'sh'
local shell = require 'shell'

isbg = sh.command('/usr/local/bin/isbg.py')

for account,account_config in pairs(config.accounts) do
  print("scanning for spam in " .. account .. "/" .. account_config.inbox_folder .. " and moving to " .. account .. "/" .. account_config.spam_folder)
  local status = isbg(
    shell.escape(
      '--noninteractive',
      '--noreport',
      '--delete',
      '--spamc',
      '--imaphost', account_config.server,
      '--imapuser', account_config.user,
      '--imappasswd', account_config.password,
      '--spaminbox', account_config.spam_folder,
      '--imapinbox', account_config.inbox_folder
    )
  )

  print(status)
  if status.__exitcode ~= 0 then
    print('----FAILED----')
  end

  print("scanning for spam in " .. account .. "/" .. account_config.inbox_folder .. " and moving to " .. account .. "/" .. account_config.spam_folder .. " done")
end
