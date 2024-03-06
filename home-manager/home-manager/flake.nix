{
  description = "Home Manager configuration of roman";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    Flakes
    ags.url = "github:Aylur/ags";
    hyprlock.url = "github:hyprwm/hyprlock";
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."roman" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ~/.config/home-manager/home.nix ];
	extraSpecialArgs = { inherit inputs; };
      };
    };
}
