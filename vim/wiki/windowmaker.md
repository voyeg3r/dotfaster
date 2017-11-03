# windowmaker.md - Last Change: asdf
É um gerenciador de janelas bem leve

# Menu
```text
(
  "Window Maker apps - por lcavalheiro",
  (
    "Run cmd...",
    SHORTCUT,
    "Mod1+F2",
    EXEC,
    "%A(Run,Type your command:)"
  ),
  (
    "Cmd line apps...",
    (
      "Terminals...",
      ("GNOME Terminal", SHORTCUT, "Control+Mod1+t", EXEC, "gnome-terminal"),
      (
        "xTerm em fundo branco",
        SHORTCUT,
        "Control+F2",
        EXEC,
        "xterm -bg white -fg black -fa Liberation -fs 12 -sl 10000"
      )
    ),
    (
      "Cliente de IRC irssi",
      EXEC,
      "xterm -bg white -fg black -fa Liberation -fs 12 -sl 10000 -e irssi"
    )
  ),
  (
    "Internet...",
    (
      "Navegadores de internet...",
      ("Google Chrome", SHORTCUT, "Control+F3", EXEC, "google-chrome"),
      ("Mozilla Iceweasel", SHORTCUT, "Control+F4", EXEC, iceweasel),
      (Opera, SHORTCUT, "Control+F5", EXEC, opera)
    ),
    (
      "Instant messages...",
      (Skype, EXEC, skype),
      (Pidgin, EXEC, pidgin)
    )
  ),
  ("Office...", EXEC, libreoffice),
  (
    "File managers...",
    ("GNOME Nautilus", SHORTCUT, "Mod4+E", EXEC, "nautilus --no-desktop"),
    ("XFCE Thunar", EXEC, thunar)
  ),
  (
    "Img Editors...",
    ("Editor bitmap GIMP", EXEC, gimp),
    ("Editor vetorial Inkscape", EXEC, inkscape)
  ),
  (
    "Visualizadores de arquivos...",
    ("Visualizador de arquivos PDF Evince", EXEC, evince),
    ("Visualizador de arquivos CBR Comix", EXEC, comix),
    ("Visualizador de imagens Eye of GNOME", EXEC, eog)
  ),
  ("Multimedia...", (Audacious, EXEC, audacious)),
  (
    "Set apearence...",
    (
      "Papel de parede...",
      OPEN_MENU,
      "-noext /usr/share/WindowMaker/Backgrounds/ /home/sergio/img/new-wallpapers/ $HOME/GNUstep/Library/WindowMaker/Backgrounds WITH wmsetbg -u -a"
    ),
    (
      "Styles...",
      OPEN_MENU,
      "-noext /usr/share/WindowMaker/Styles $HOME/GNUstep/Library/WindowMaker/Styles WITH setstyle"
    ),
    (
      "Preset themes...",
      OPEN_MENU,
      "-noext /usr/share/WindowMaker/Themes $HOME/GNUstep/Library/WindowMaker/Themes WITH setstyle"
    ),
    (
      "Save as...",
      EXEC,
      "getstyle -p \"%a(Nome do tema,Salvar tema como...)\""
    )
  ),
  (
    "Screen shot...",
    (
      "Toda a tela",
      SHEXEC,
      "import -border -window root ~/Imagens/$(date --rfc-3339=seconds).png"
    ),
    (
      "Apenas a janela ativa",
      SHORTCUT,
      "Mod1+F1",
      SHEXEC,
      "import -border -window $(xdotool getwindowfocus -f) ~/Imagens/$(date --rfc-3339=seconds).png"
    )
  ),
  (
    "Desktops...",
    ("Manage workspaces...", WORKSPACE_MENU),
    (
      "Gerenciar \303\241rea de trabalho atual...",
      ("Organizar \303\255cones", ARRANGE_ICONS),
      ("Atualizar a \303\241rea de trabalho", REFRESH),
      ("Esconder janelas inativas", HIDE_OTHERS),
      ("Mostrar todas as janelas", SHOW_ALL),
      ("Salvar o estado da \303\241rea de trabalho", SAVE_SESSION),
      ("Limpar o estado da \303\241rea de trabalho", CLEAR_SESSION)
    )
  ),
  (
    "Aplicativo para configura\303\247\303\243o do Window Maker WPrefs",
    EXEC,
    WPrefs
  ),
  ("Painel de informa\303\247\303\265es do Window Maker", INFO_PANEL),
  ("Reiniciar Window Maker", RESTART),
  ("Sair do Window Maker", EXIT)
)
```
