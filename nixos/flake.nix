{
  description = "Roman's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # My flakes
    ags.url = "github:Aylur/ags";
    hyprlock.url = "github:hyprwm/hyprlock";
    hyprland.url = "github:hyprwm/Hyprland/9e4b2efe7e24f7b21faefbd50a88f25b5185bc35";
    /*Hyprspace = {
      url = github:KZDKM/Hyprspace;
      inputs.hyprland.follows = "hyprland";
    };*/

    # Cosmic
    nixos-cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Custom flakes
    game-setting-manager.url = "github:Jozhin-s-Bazhin/game-setting-manager";
    #pyprland.url = "github:Jozhin-s-Bazhin/pyprland/flake_application";
  };

  outputs = inputs@{ nixpkgs, home-manager, hyprland, nixos-cosmic, ... }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
	      specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix

	  {
	    nix.settings = {
	      substituters  = [ 
	        "https://cosmic.cachix.org/" 
	        "https://hyprland.cachix.org" 
	      ];
	      trusted-public-keys = [ 
	        "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" 
		"hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
	      ];
	    };
	  }
	  nixos-cosmic.nixosModules.default

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.roman = import ./home/home.nix;
	    home-manager.extraSpecialArgs = { inherit inputs; };
          }
        ];
      };
    };
  };
}
