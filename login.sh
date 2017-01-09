#!/usr/bin/expect
#Login to QNAP over SSH and use du to gather folder names

set timeout 20

spawn ssh "admin@10.0.1.200"

expect "password:"
send "YOURPASSWORD\r";

expect "#"
send "/usr/bin/du --summarize /share/CACHEDEV1_DATA/*\r";

expect "#"
send -- "exit\r";

expect eof
