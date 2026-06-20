{
    description = "First NixOS flake";


    inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
      # home-manager -> manage user configuration
      home-manager = {
        url = "github:nix-community/home-manager/release-25.11";
        # The 'follows' keyword is used to prevent compatibility issues
        inputs.nixpkgs.follows = "nixpkgs";
      };
      lanzaboote = {
        url = "github:nix-community/lanzaboote/v1.0.0";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      # Zen browser flake
      zen-browser = {
        url = "github:youwen5/zen-browser-flake";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };

    outputs = { self, nixpkgs, home-manager, lanzaboote, ... }@inputs: {

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = { inherit inputs; };

      modules = [
        lanzaboote.nixosModules.lanzaboote
        ./configuration.nix 
	./fonts.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit inputs; };
          home-manager.users.nico = import ./home.nix;
          
        }
      ];
    };
  };
}
