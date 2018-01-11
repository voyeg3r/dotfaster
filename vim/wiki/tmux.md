# tmux.md - Last Change: 2018 jan 11 17:06
+ https://www.youtube.com/watch?v=wKEGA8oEWXw

Tmux is a Terminal multiplexer

To change the prefix key, add the following to your `~/.tmux.conf`

    unbind C-b set -g prefix C-a

# Shortcuts

    Ctrl-b <command>

    C-b ?  ........... list tmux shortcuts
    C-b %  ........... split window vertically (new panel)
    C-b ;  ........... toggle last active pane
    C-b q  ........... show pane numbers
    C-b o  ........... swhich to next pane
    C-b x  ........... close current pane
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

    C-b : ............ open console
    :new-window -n processes "top"

# Show tmux sessions

    tmux list-keys ........................ listar os atalhos
    C-b ?
    tmux new[-session] -s principal ....... cria nova sessão com nome principal
    tmux new -s development -n editor ..... new session and name window editor
    tmux attach -t development
    tmux ls ............................... mostra sessões do tmux

    C-b d ................................. detach from a session
    tmux attach -t principal .............. anexa terminal a uma sessão
    tmux attach ........................... attach to a single section

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


