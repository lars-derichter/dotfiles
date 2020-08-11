#!/bin/sh

/usr/local/bin/gpg --import ~/.gnupg/private.key
expect -c "spawn gpg --edit-key 472D6B4D6F760DD88F480E54306A874F98AFF064 trust quit; send \"5\ry\r\"; expect eof"
rm ~/.gnupg/private.key

echo "\nCheck if key is shown with ultimate trust and correct identity"
/usr/local/bin/gpg --list-keys

# (re)start gpg-agent
killall gpg-agent
gpg-agent --daemon