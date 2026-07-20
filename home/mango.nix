{ pkgs, ... }:

{
  wayland.windowManager.mango = {
    enable = true;

    autostart_sh = ''
      waybar &
      awww-daemon &
      awww img /home/nico/.wallpapers/wallpaper.jpg &
      lxqt-policykit-agent &
    '';
    
    extraConfig = ''
      monitorrule=name:DP-1,width:1920,height:1080,refresh:144,x:0,y:0
    '';
      
    settings = {
      # Window effects
      blur = 0;
      border_radius = 6;
      focused_opacity = 1.0;

      # Animations
      animations = 1;
      animation_type_open = "slide";
      animation_type_close = "slide";
      animation_duration_open = 400;
      animation_duration_close = 400;
      animation_curve = {
	open = "0.46,1.0,0.29,1.1";
	close = "0.08,0.92,0,1";
	move = "0.46,1.0,0.29,1";
	tag = "0.46,1.0,0.29,1";
	focus = "0.46,1.0,0.29,1";
      };

      xkb_rules_layout = "us";

      mouse_accel_profile = 0;

      # Appearance
      borderpx = 4;
      gappih = 5;
      gappiv = 5;
      gappoh = 10;
      gappov = 10;
      rootcolor = "0xb4befeff";
      bordercolor = "0x1e1e2eff";
      focuscolor = "0xb4befeff";
      maximizescreencolor = "0xcba6f7ff";

      windowrule = [
	"appid:^pavucontrol$,isfloating:1,width:0.5,height:0.6"
	"appid:^org.pulseaudio.pavucontrol$,isfloating:1,width:0.5,height:0.6"
      ];

      # Keybinds
      bind = [
	"SUPER,T,spawn,kitty"
	"SUPER,R,spawn,rofi -show drun"
	"SUPER,Q,killclient"
	"SUPER,L,spawn,wlogout"
	"SUPER+CTRL+SHIFT,r,reload_config"
        "SUPER,Tab,focusstack,next"
	"ALT,Left,focusdir,left"
	"ALT,Right,focusdir,right"
	"ALT,Up,focusdir,up"
	"ALT,Down,focusdir,down"
	"SUPER+SHIFT,Up,exchange_client,up"
	"SUPER+SHIFT,Down,exchange_client,down"
	"SUPER+SHIFT,Left,exchange_client,left"
	"SUPER+SHIFT,Right,exchange_client,right"
	"CTRL+SHIFT,Up,movewin,+0,-50"
	"CTRL+SHIFT,Down,movewin,+0,+50"
	"CTRL+SHIFT,Left,movewin,-50,+0"
	"CTRL+SHIFT,Right,movewin,+50,+0"
	"CTRL+ALT,Up,resizewin,+0,-50"
	"CTRL+ALT,Down,resizewin,+0,+50"
	"CTRL+ALT,Left,resizewin,-50,+0"
	"CTRL+ALT,Right,resizewin,+50,+0"
	"ALT,f,togglefullscreen,"
	"SUPER,i,minimized,"
	"SUPER+SHIFT,I,restore_minimized"
	"ALT,e,set_proportion,1.0"
	"ALT,x,switch_proportion_preset,"
	"ALT,x,switch_proportion_preset,prev"
	"alt+super+ctrl,Left,scroller_stack,left"
	"alt+super+ctrl,Right,scroller_stack,right"
	"alt+super+ctrl,Up,scroller_stack,up"
	"alt+super+ctrl,Down,scroller_stack,down"
	"SUPER,e,incnmaster,1"
	"SUPER,t,incnmaster,-1"
	"ALT,s,zoom,"
	"CTRL+SUPER,i,setlayout,tile"
	"CTRL+SUPER,l,setlayout,scroller"
	"SUPER,n,switch_layout"
	"SUPER,Left,viewtoleft,0"
	"SUPER,Right,viewtoright,0"
	"CTRL+SUPER,Left,tagtoleft,0"
	"CTRL+SUPER,Right,tagtoright,0"

	"Super,1,view,1,0"
	"Super,2,view,2,0"
	"Super,3,view,3,0"
	"Super,4,view,4,0"
	"Super,5,view,5,0"
	"Super,6,view,6,0"
	"Super,7,view,7,0"
	"Super,8,view,8,0"
	"Super,9,view,9,0"

	"Alt,1,tag,1,0"
	"Alt,2,tag,2,0"
	"Alt,3,tag,3,0"
	"Alt,4,tag,4,0"
	"Alt,5,tag,5,0"
	"Alt,6,tag,6,0"
	"Alt,7,tag,7,0"
	"Alt,8,tag,8,0"
	"Alt,9,tag,9,0"

	"ctrl+Super,1,toggletag,1"
	"ctrl+Super,2,toggletag,2"
	"ctrl+Super,3,toggletag,3"
	"ctrl+Super,4,toggletag,4"
	"ctrl+Super,5,toggletag,5"
	"ctrl+Super,6,toggletag,6"
	"ctrl+Super,7,toggletag,7"
	"ctrl+Super,8,toggletag,8"
	"ctrl+Super,9,toggletag,9"

	"ctrl,1,toggleview,1"
	"ctrl,2,toggleview,2"
	"ctrl,3,toggleview,3"
	"ctrl,4,toggleview,4"
	"ctrl,5,toggleview,5"
	"ctrl,6,toggleview,6"
	"ctrl,7,toggleview,7"
	"ctrl,8,toggleview,8"
	"ctrl,9,toggleview,9"

	"alt+shift,Backspace,dwindle_toggle_split_direction"
      ];

      mousebind = [
	"SUPER,btn_left,moveresize,curmove"
	"alt,btn_middle,set_proportion,0.5"
	"SUPER,btn_right,moveresize,curresize"
	"SUPER+CTRL,btn_left,minimized"
	"SUPER+CTRL,btn_right,killclient"
	"SUPER+CTRL,btn_middle,togglefullscreen"
	"NONE,btn_middle,togglemaximizescreen,0"
      ];

    };
  };  


}
