-- One of the work mailservers is slow.
-- The time in seconds for the program to wait for a mail server's response (default 60)
options.timeout = 120

-- According to the IMAP specification, when trying to write a message to a non-existent mailbox, the server must send a hint to the client, whether it should create the mailbox and try aga>
options.create = true

-- By enabling this option new mailboxes that were automatically created, get also subscribed; they are set active in order for IMAP clients to recognize them
options.subscribe = true

-- Normally, messages are marked for deletion and are actually deleted when the mailbox is closed. When this option is enabled, messages are expunged immediately after being marked deleted.
options.expunge = true

package.path = package.path .. ';/root/imap_config/?.lua'
local config = require "imap_account_config"

for account,account_config in pairs(config.accounts) do
  imap_account = IMAP {
    server = account_config.server,
    username = account_config.user,
    password = account_config.password,
    ssl = 'ssl23'
  }
  if account_config.custom_lua_script then
    local processor = require(account_config.custom_lua_script)

    processor.process(imap_account)
  end
end
