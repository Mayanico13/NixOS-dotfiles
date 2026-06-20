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
		    "hyprland/submap"
		    "wlr/taskbar"
		];
		modules-center = [
		    "hyprland/window"
		];
		modules-right = [
		    "clock"
		];
		
		"hyprland/workspaces" = {
		    format = "{icon}";
		};
	    };
	};
    };
}
