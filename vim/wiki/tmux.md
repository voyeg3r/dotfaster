# tmux.md - Last Change: 2018 jan 15 09:55
+ https://www.youtube.com/watch?v=wKEGA8oEWXw
+ https://leanpub.com/the-tao-of-tmux/read
+ https://github.com/tony/tmux-config/blob/master/.tmux.conf

Tmux is a Terminal multiplexer

To change the prefix key, add the following to your `~/.tmux.conf`

    unbind C-b set -g prefix C-a

# You can specify your config via the -f command. Like this:

    tmux -f path/to/config.conf

Note: If a tmux server is running in the background and you want to test a fresh config, you must either shut down the rest of the tmux sessions or use a different socket name. Like this:

    tmux -f path/to/config.conf -Ltesting_tmux

And you can treat everything like normal; just keep passing -Ltesting_tmux (or whatever socket name you feel like testing configs with) for reuse.

    tmux -Ltesting_tmux attach

# Shortcuts

    Ctrl-b <command>

    C-b ?  ........... list tmux shortcuts
    C-b %  ........... split window vertically (new pane)
    C-b ;  ........... toggle last active pane
    C-b q  ........... show pane numbers
    C-b o  ........... swhich to next pane
    C-b x  ........... close current pane
    C-b z  ........... toggle current pane intto fullscreen
    C-b !  ........... convert pane into window
    C-b "  ........... split window horizontally
    C-b c  ........... create a new window
    C-b n  ........... next window
    C-b p  ........... previous window
    C-b w  ........... list windows
    C-b f  ........... find window
    Ctrl-b l ......... Move to the previously selected window
    Ctrl-b 3 ......... Move to the window 3
    C-b ?  ........... show shortcuts
    C-b <Spacebar> ... change layout
    C-d  ............. close window
    C-b , ............ rename window
    C-b $ ............ rename current session
    C-b [ ............ enters copy-mode (jklh) shift-v
    C-b ] ............ paste-mode
    C-b = ............ list all paste buffers
    C-b t ............ show clock
    C-b :kill-kill session ................ kill current session

    C-b : ............ open console
    :new-window -n processes "top"

# Show tmux sessions

    tmux list-keys ........................ listar os atalhos
    C-b ?
    tmux new[-session] -s principal ....... cria nova sessão com nome principal
    tmux new -s development -n editor ..... new session and name window editor
    tmux attach -t development
    tmux kill-session -t 0  ............... kill session named 0
    tmux ls ............................... mostra sessões do tmux

    C-b d ................................. detach from a session
    tmux attach -t principal .............. anexa terminal a uma sessão
    tmux a[ttach] ........................... attach to a single section
    tmux new-session \; split-window -v ... starts tmux with splited window

# many commands at startup

``` markdown
tmux new-session \; \
  send-keys 'tail -f /var/log/monitor.log' C-m \; \
  split-window -v \; \
  split-window -h \; \
  send-keys 'top' C-m \;
```

And the resulting session should look like that.

``` markdown
------------
|  tail    |
|----------|
|    | top |
------------
```

``` markdown
tmux new-session \; \
  send-keys 'tail -f /var/log/monitor.log' C-m \; \
  split-window -v -p 75 \; \
  split-window -h -p 30 \; \
  send-keys 'top' C-m \; \
  select-pane -t 1 \; \
  split-window -v \; \
  send-keys 'weechat' C-m \;
```

``` markdown
tmux new-session -s conftmux \; \
  send-keys 'v tmux.conf' C-m \; \
  split-window -v -p 50 \; \
  select-pane -t 2 \; \
  send-keys 'v tmux.md' C-m \;
```

# Creating new sessions

``` markdown
tmux new windows -n shell
```
By using the -n flag, we tell tmux to name the first window so we can identify
it easily.

# closing tmux sessions

To close a specific session, use

``` markdown
tmux list-sessions
```

to identify the session you
want to kill, and then use

``` markdown
tmux kill-session -t targetSession
```

to kill that specific session.

Also you can grossly kill all tmux processes with `pkill -f tmux`.


