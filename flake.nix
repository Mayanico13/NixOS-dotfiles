{
    description = "First NixOS flake";


    inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
      # home-manager -> manage user configuration
      home-manager = {
        type = "github";
	owner = "nix-community";
	repo = "home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      lanzaboote = {
        type = "github";
	owner = "nix-community";
	repo = "lanzaboote";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      # Zen browser flake
      zen-browser = {
	type = "github";
	owner = "youwen5";
	repo = "zen-browser-flake";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      # MangoWM flake
      mango = {
	type = "github";
	owner = "mangowm";
	repo = "mango";
	inputs.nixpkgs.follows = "nixpkgs";
      };
    };

    outputs = { self, nixpkgs, home-manager, lanzaboote, mango, ... }@inputs: {

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = { inherit inputs; };

      modules = [
        lanzaboote.nixosModules.lanzaboote
        ./configuration.nix 
	./fonts.nix
	inputs.mango.nixosModules.mango
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
