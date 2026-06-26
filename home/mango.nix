{ pkgs, ... }:

{
  wayland.windowManager.mango = {
    enable = true;

    autostart_sh = ''
      waybar &
      awww-daemon &
      awww img /home/nico/.wallpapers/evening-sky.png &
      polkit-agent-helper-1 &
      systemctl start --user polkit-gnome-authentication-agent-1
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

      xkb_rules_layout = "it";

      mouse_accel_profile = 0;

      # Keybinds
      bind = [
	"SUPER,T,spawn,kitty"
	"SUPER,R,spawn,rofi -show drun"
	"SUPER,Q,killclient"
      ];

    };
  };  


}
