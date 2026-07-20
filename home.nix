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
      lxqt.lxqt-policykit
      pavucontrol
    ];
    
    programs.git = {
      enable = true;
      settings = {
      	user.name = "Mayanico13";
      	user.email = "90696888+Mayanico13@users.noreply.github.com";
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

    services.awww.enable = true;
        
    imports = [
      inputs.mango.hmModules.mango
      ./home
    ];

    # This value determines the home Manager relase
    # compatible with configuration.
    
    home.stateVersion = "26.05";
}
