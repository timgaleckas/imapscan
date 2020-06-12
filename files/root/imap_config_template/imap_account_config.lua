return {
  accounts = {
    default = {
      server = "example.com",
      user = "noone@example.com",
      password = "password",
      spam_folder = "Spam",
      inbox_folder = "Inbox",
      ham_learning_folder = null,
      spam_learning_folder = null,
      custom_lua_script = 'custom_processor',
    }
  }
}
