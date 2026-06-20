{ config, pkgs, ... }:

{
    home.username = "nico";
    home.homeDirectory = "/home/nico";

    # Packages installed to user profile
    home.packages = with pkgs; [
      which
      fastfetch
      zip
      xz
      unzip
      btop
    ];
    
    programs.git = {
      enable = true;
      userName = "Mayanico13";
      userEmail = "90696888+Mayanico13@users.noreply.github.com";
      extraConfig = {
	init.defaultbranch = "main";
      };
    };

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      
      shellAliases = {
        ll = "ls -l";
      };
      history.size = 10000;
    };
     
    services.polkit-gnome.enable = true;
    systemd.user.services.polkit-gnome-authentication-agent-1 = {
      Unit = {
      Description = "polkit-gnome-authentication-agent-1";
      Wants = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
      };
    };

    services.hyprpaper = {
	enable = true;
	settings = {
	    preload = [
		"/home/nico/.wallpapers/evening-sky.png"
	    ];
	    wallpaper = [
		"DP-1,/home/nico/.wallpapers/evening-sky.png"
	    ];
	};
    };
        
    imports = [
      ./home
    ];

    # This value determines the home Manager relase
    # compatible with configuration.
    
    home.stateVersion = "25.11";
}
