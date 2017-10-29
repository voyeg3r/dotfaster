# Alsamixer
+ http://blog.chapagain.com.np/ubuntu-linux-increase-decrease-volume-from-command-line-keyboard-shortcut/

```markdown
Last Change: sáb 28 out 2017 16:00:32 -03
```

Cotrola aspectos do som no linux

    amixer -q set 'Master' 10%+

A opção -q inibe as mensagens de saida

# Howto save AlsaMixer settings?
+ https://askubuntu.com/a/465641/3798

You could also save the mixer settings into a custom file with alsactl:

    alsactl --file ~/.config/asound.state store

Reloading:

    alsactl --file ~/.config/asound.state restore


This can be further improved with placing the second line, the restore command into a .desktop file.

You will need to run nano ~/.config/autostart/alsarestore.desktop, which will
open nano text editor and create ~/.config/autostart/alsarestore.desktop file.
Entries in ~/.config/autostart/ directory are used to autostart programs and
services for specific user on startup/graphical login.

The contents of the .desktop file should be the following:

    [Desktop Entry]
    Type=Application
    Terminal=false
    Name=alsarestore
    Exec=alsactl --file ~/.config/asound.state restore
