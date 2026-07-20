{ pkgs, ... }:
 
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    configType = "hyprlang";
    settings = {
      # Monitor setup
      monitor = "DP-1,1920x1080@144, 0x0, 1";
      # Application startup options
      exec-once = [
        "awww-daemon"
	"awww img /home/nico/.wallpapers/wallpaper.jpg"
	"waybar"
	"lxqt-policykit-agent"
      ];
      
      input = {
        kb_layout = "us";
	accel_profile = "flat";
      };
      "$mod" = "SUPER";
   
      bind = [
        "$mod, T, exec, kitty"
        "$mod, Q, killactive,"
	"$mod, R, exec, rofi -show drun"
        "$mod, F, exec, zen"
	"$mod, L, exec, wlogout"
        "$mod, space, togglefloating,"
        
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"
 
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10" 
 
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"       
      ];
      bindm = [
      # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
      general = {
        border_size = "2";
        gaps_in = "8, 8, 8, 8";
        gaps_out = "8, 8, 8, 8";
        gaps_workspaces = "0";
	
        "col.inactive_border" = "rgba(45475aff)";
        "col.active_border" = "rgba(b4befeff)";
        layout = "dwindle";
        no_focus_fallback = true;
        resize_on_border = true;
        extend_border_grab_area = "5";
        hover_icon_on_border = true;
        allow_tearing = true;
        resize_corner = "0"; 
       };

       decoration = {
         rounding = "10";
         rounding_power = "2.0";
         active_opacity = "1";
         inactive_opacity = "1";
         fullscreen_opacity = "1";
         dim_inactive = false;
         #screen_shader = "";
         #border_part_of_window = true;
         
         shadow = {
           enabled = true;
           range = "4";
           render_power = "3";
           color = "0xee1a1a1a";
          };

          blur = { 
	    enabled = true;
	    size = "3";
	    passes = "1";
	    vibrancy = "0.1696";
          };
        };
 
       animations = {
         enabled = true;
	 bezier = [
            "myBezier, 0.05, 0.9, 0.1, 1.05"
            "overshot, 0.13, 0.99, 0.29, 1.1" # Effetto "rimbalzo" molto popolare
         ];

          animation = [
              "windows, 1, 5, overshot, slide"          # Animazione di apertura finestre
              "windowsOut, 1, 5, default, popin 80%"    # Animazione di chiusura finestre
              "border, 1, 10, default"                  # Transizione del colore del bordo
              "borderangle, 1, 8, default"              # Rotazione del gradiente sul bordo
              "fade, 1, 7, default"                     # Effetto dissolvenza
              "workspaces, 1, 6, overshot, slide"       # Cambio spazio di lavoro
          ];  
       };
	misc = {
	  disable_hyprland_logo = true;
	};
    };
  };
}
