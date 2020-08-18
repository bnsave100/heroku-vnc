#!/usr/bin/expect -f
spawn vncpasswd
expect  "*word:*"
send "66656665\n"
expect  "*Verify:*"
send "66656665\n"
expect eof
