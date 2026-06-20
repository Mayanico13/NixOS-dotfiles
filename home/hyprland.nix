{ pkgs, ... }:
 
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      # Monitor setup
      monitor = "DP-1,1920x1080@144, 0x0, 1";
      # Application startup options
      exec-once = [
        "hyprpaper"
	"waybar"
      ];
      
      input = {
        kb_layout = "it";
	accel_profile = "flat";
      };

      "$mod" = "SUPER";
   
      bind = [
        "$mod, T, exec, kitty"
        "$mod, Q, killactive,"
	"$mod, R, exec, rofi -show run"
        "$mod, F, exec, zen"
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
        border_size = "1";
        no_border_on_floating = false;
        gaps_in = "5, 5, 5, 5";
        gaps_out = "5, 5, 5, 5";
        gaps_workspaces = "0";
       # col.inactive_border = "#E94057";
       # col.active_border = "#3b8d99";
       # col.nogroup_border = "#240b36";
       # col.nogroup_border_active = "#93291E";
        "layout" = "dwindle";
        no_focus_fallback = true;
        resize_on_border = true;
        extend_border_grab_area = "5";
        hover_icon_on_border = true;
        allow_tearing = true;
        resize_corner = "0"; 
       };

       decoration = {
         rounding = "6";
         rounding_power = "4.0";
         active_opacity = "1";
         inactive_opacity = "1";
         fullscreen_opacity = "1";
         dim_inactive = false;
         #screen_shader = "";
         #border_part_of_window = true;
         
         shadow = {
           enabled = false;
#           range = "4";
#           render_power = "3";
#           sharp = false;
#           ignore_window = true;
#           color = "0xee1a1a1a";
#          #offset = [0 0];
#           scale = "1.0";
          };
       };
 
       animations = {
         enabled = true;  
       };

	misc = {
	  disable_hyprland_logo = true;
	};
    };

  };
}
