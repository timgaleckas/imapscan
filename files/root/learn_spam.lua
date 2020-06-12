package.path = package.path .. ';/root/imap_config/?.lua'
local config = require "imap_account_config"
local sh = require 'sh'
local shell = require 'shell'

isbg = sh.command('/usr/local/bin/isbg.py')

for account,account_config in pairs(config.accounts) do
  if account_config.spam_learning_folder and account_config.ham_learning_folder then
    print("learning spam in " .. account .. "/" .. account_config.spam_learning_folder .. " and ham in " .. account .. "/" .. account_config.ham_learning_folder)

    local status = isbg(
      shell.escape(
        '--noninteractive',
        '--spamc',
        '--imaphost', account_config.server,
        '--imapuser', account_config.user,
        '--imappasswd', account_config.password,
        '--learnspambox', account_config.spam_folder,
        '--learnhambox', account_config.inbox_folder,
        '--teachonly'
      )
    )

    print(status)
    if status.__exitcode ~= 0 then
      print('----FAILED----')
    end

    print("learning spam in " .. account .. "/" .. account_config.spam_learning_folder .. " and ham in " .. account .. "/" .. account_config.ham_learning_folder .. ' done')
  end
end
