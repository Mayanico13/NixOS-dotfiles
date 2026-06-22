{ config, pkgs, inputs, ... }:

{
    home.username = "nico";
    home.homeDirectory = "/home/nico";

    # Packages installed to user profile
    home.packages = with pkgs; [
      zed-editor
      which
      fastfetch
      zip
      xz
      unzip
      btop
      pkgs.polkit_gnome
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

    programs.vesktop.enable = true;
     
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

    services.awww.enable = true;
        
    imports = [
      inputs.mango.hmModules.mango
      ./home
    ];

    # This value determines the home Manager relase
    # compatible with configuration.
    
    home.stateVersion = "26.05";
}
