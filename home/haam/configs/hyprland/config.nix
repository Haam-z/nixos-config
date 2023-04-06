''
  # Autostart programs
  exec-once = xprop -root -f _XWAYLAND_GLOBAL_OUTPUT_SCALE 32c -set _XWAYLAND_GLOBAL_OUTPUT_SCALE 2

  # Input
  input {
    kb_layout = us
    follow_mouse = 1
    touchpad {
        disable_while_typing = true
        natural_scroll = true
        tap-to-click = true
    }
    sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
  }

  # General
  general {
    gaps_in = 2
    gaps_out = 2
    border_size = 1
    col.active_border=0xffcba6f7
    col.inactive_border=0xff313244
    no_border_on_floating = true
    layout = dwindle
    main_mod = SUPER
  }

  # Misc
  misc {
    disable_hyprland_logo = true
    disable_splash_rendering = true
    mouse_move_enables_dpms = true
    no_vfr = false
    enable_swallow = true
    swallow_regex = ^(kitty)$
  }

  # Decorations
  decoration {
    # Rounded corners
    rounding = 8
    multisample_edges = true

    # Opacity
    active_opacity = 1.0
    inactive_opacity = 1.0

    # Blur
    blur = false
    # Shadow
    drop_shadow = flase
  }

  # Animations
  animations {
    enabled = true
    # bezier curve
    bezier = smoothOut, 0, 0.55, 0.45, 1
    bezier = smoothIn, 0.85, 0, 0.15,1
    bezier = base, 1, 1, 1,1

    # animation list
    animation = windowsIn, 1, 1, smoothIn, popin
    animation = windowsOut, 1, 1, smoothOut, popin
    animation = windowsMove, 0, 0,base
    animation = fadeIn, 1, 1, smoothIn
    animation = fadeOut, 1, 1, smoothOut
    animation = fadeDim, 1, 1, smoothIn
    animation = workspaces, 1, 1, somthIn, fade
  }

  # Gestures
  gestures {
    workspace_swipe = true
    workspace_swipe_fingers = 3
  }

  # Layouts
  dwindle {
    col.group_border_active=0xff89b4fa
    col.group_border=0xff585b70
    no_gaps_when_only = true
    pseudotile = true # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
    preserve_split = true # you probably want this
  }

  # Window rules
  windowrule = center, file_progress
  windowrule = center, confirm
  windowrule = center, dialog
  windowrule = center, download
  windowrule = center, notification
  windowrule = center, error
  windowrule = center, splash
  windowrule = center, confirmreset
  windowrule = center, title:Open File
  windowrule = center, title:branchdialog
  windowrule = float, bemenu

  # Variables
  $myTerminal = "alacritty"
  $myBrowser = "firefox"
  $myPrivetBrowser = "tor-browser"
  $myEditor  = "emacsclient -c -a 'emacs'"
  $myFileManager = "nemo"
  $myGameLauncher  = "steam"
  $myCMDLauncher = "dmenu_run"
  $myLauncher = "j4-dmenu-desktop --dmenu='dmenu'"
  $myClipBoard = "clipmenu"

  # Apps
  bind = SUPER, T , exec,  $myTerminal
  bind = SUPER SHIFT, E, exec, $myEditor
  bind = SUPER SHIFT, F, exec, $myFileManager
  bind = SUPER SHIFT, B, exec, $myBrowser

  # Function keys
  bind = ,XF86MonBrightnessUp, exec, brightness set +5%
  bind = ,XF86MonBrightnessDown, exec, brightness set 5%-
  bind = ,XF86AudioRaiseVolume, exec, volume -i 5
  bind = ,XF86AudioLowerVolume, exec, volume -d 5
  bind = ,XF86AudioMute, exec, volume -t
  bind = ,XF86AudioMicMute, exec, microphone -t

  # Screenshots
  $screenshotarea = hyprctl keyword animation "fadeOut,0,0,default"; grimblast --notify copysave area; hyprctl keyword animation "fadeOut,1,4,default"
  bind = , Print, exec, $screenshotarea
  bind = CTRL, Print, exec, grimblast --notify --cursor copysave output
  bind = SUPER SHIFT CTRL, R, exec, grimblast --notify --cursor copysave output
  bind = ALT, Print, exec, grimblast --notify --cursor copysave screen
  bind = SUPER SHIFT ALT, R, exec, grimblast --notify --cursor copysave screen

  # Misc
  bind = SUPER, C, exec, hyprpicker -a -n
  bind = CTRL ALT, L, exec, swaylock
  bind = SUPER SHIFT, O, exec, run-as-service wl-ocr

  # Window management
  bind = SUPER, Q, killactive,
  bind = SUPER, M, exit,
  bind = SUPER, F, fullscreen,
  bind = SUPER, Space, togglefloating,
  bind = SUPER, P, pseudo, # dwindle
  bind = SUPER, J, togglesplit, # dwindle

  # Focus
  bind = SUPER, left, movefocus, l
  bind = SUPER, right, movefocus, r
  bind = SUPER, up, movefocus, u
  bind = SUPER, down, movefocus, d

  # Move
  bind = SUPER SHIFT, left, movewindow, l
  bind = SUPER SHIFT, right, movewindow, r
  bind = SUPER SHIFT, up, movewindow, u
  bind = SUPER SHIFT, down, movewindow, d

  # Resize
  bind = SUPER CTRL, left, resizeactive, -20 0
  bind = SUPER CTRL, right, resizeactive, 20 0
  bind = SUPER CTRL, up, resizeactive, 0 -20
  bind = SUPER CTRL, down, resizeactive, 0 20

  # Tabbed
  bind= SUPER, g, togglegroup
  bind= SUPER, tab, changegroupactive

  # Special workspace
  bind = SUPER, grave, togglespecialworkspace
  bind = SUPERSHIFT, grave, movetoworkspace, special

  # Switch workspaces
  bind = SUPER, 1, workspace, 1
  bind = SUPER, 2, workspace, 2
  bind = SUPER, 3, workspace, 3
  bind = SUPER, 4, workspace, 4
  bind = SUPER, 5, workspace, 5
  bind = SUPER, 6, workspace, 6
  bind = SUPER, 7, workspace, 7
  bind = SUPER, 8, workspace, 8
  bind = SUPER, 9, workspace, 9
  bind = SUPER, 0, workspace, 10
  bind = SUPER ALT, up, workspace, e+1
  bind = SUPER ALT, down, workspace, e-1

  # Move active window to a workspace
  bind = SUPER SHIFT, 1, movetoworkspace, 1
  bind = SUPER SHIFT, 2, movetoworkspace, 2
  bind = SUPER SHIFT, 3, movetoworkspace, 3
  bind = SUPER SHIFT, 4, movetoworkspace, 4
  bind = SUPER SHIFT, 5, movetoworkspace, 5
  bind = SUPER SHIFT, 6, movetoworkspace, 6
  bind = SUPER SHIFT, 7, movetoworkspace, 7
  bind = SUPER SHIFT, 8, movetoworkspace, 8
  bind = SUPER SHIFT, 9, movetoworkspace, 9
  bind = SUPER SHIFT, 0, movetoworkspace, 10

  # Mouse bindings
  bindm = SUPER, mouse:272, movewindow
  bindm = SUPER, mouse:273, resizewindow
  bind = SUPER, mouse_down, workspace, e+1
  bind = SUPER, mouse_up, workspace, e-1
''
