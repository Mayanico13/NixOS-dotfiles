{ pkgs, ... }:

{
    programs.waybar = {
	enable = true;
	settings = {
	    mainBar = {
		layer = "top";
		position = "top";
		height = 30;
		output = [
		    "DP-1"
		];
		modules-left = [
		    "hyprland/workspaces"
		];
		modules-center = [
		    "hyprland/window"
		];
		modules-right = [
		    "pulseaudio"
		    "clock"
		];
		
		"hyprland/workspaces" = {
		    format = "{icon}";
		};
		
		"hyprland/window" = {
		    format = "{title}";
		};

		"pulseaudio" = {
		    format = "{volume}% {icon}";
                    format-icons = {
			default = ["" "" ""];
		    };
		    
		    on-click = "pavucontrol";
		    on-click-right = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
		};

	    };
	};
	style = "
	    *{
		font-family: 'FiraCode Nerd Font', 'FiraCode NF', 'monospace';
		font-size: 13px;
	    }
	    
	    #waybar {
		background-color: #1e1e2e;
		color: #cdd6f4;
	    }

	    #pulseaudio {
		background-color: #94e2d5;
		color: #11111b;
		padding: 0 10px;
		border-radius: 5px;
	    }

	    #workspaces button {
		background: none;
		color: #92e2d5;
	    }
	";
    };
}
