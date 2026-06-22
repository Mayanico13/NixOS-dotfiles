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
		    "ext/workspaces"
		];
		modules-center = [
		    "dwl/window"
		];
		modules-right = [
		    "clock"
		];
		
		"ext/workspaces" = {
		    format = "{icon}";
		    ignore-hidden = true;
		    on-click = "activate";
		    on-click-right = "deactivate";
		    sort-by-id = true;
		};
		
		"dwl/window" = {
		    format = "[{layout}] {title}";
		};
	    };
	};
    };
}
