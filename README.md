Docker container that uses [isbg](https://github.com/dc55028/isbg) and [imapfilter](https://github.com/lefcha/imapfilter) to filter out spam from a remote IMAP server.

Configuration: There are 2 volumes, their content is initialized during container startup:

/var/spamassassin : holds the SpamAssassin data files, to keep them between container resets.
/root/imap_config: holds the IMAP accounts configuration.

To configure your IMAP accounts, edit the accounts_imap_account_config.lua in the /root/imap_config directory in the container, or in the /root/imap_config volume on the host.

The container runs a learning process on startup, so do not leave a configuration with a huge email directory active if you want the container to start in a reasonnable time.
