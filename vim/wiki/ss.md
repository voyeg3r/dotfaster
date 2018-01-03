# ss.md - Last Change: qua 03 jan 2018 13:48:28 -03
+ https://www.linux.com/learn/intro-to-linux/2017/7/introduction-ss-command

ss command is a tool used to dump socket statistics and displays information in
similar fashion (although simpler and faster) to netstat.

If you issue the ss command without any arguments or options, it will return a
complete list of TCP sockets with established connections

think of it this way: ss can be used to view TCP connections by using the -t
option, UDP connections by using the -u option, or UNIX connections by using
the -x option; so ss -t,  ss -u, or ss -x. Running any of those commands will
list out plenty of information for you to comb through

 If we want to pick up connections that are listening, we have to add the -a
 option like:

    ss -t -a
