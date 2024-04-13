{
  description = "Roman's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # My flakes
    ags.url = "github:Aylur/ags";
    #hyprlock.url = "github:hyprwm/hyprlock";
    hyprland.url = "github:hyprwm/Hyprland/9e4b2efe7e24f7b21faefbd50a88f25b5185bc35";
    Hyprspace = {
      url = github:KZDKM/Hyprspace;
      inputs.hyprland.follows = "hyprland";
    };
    #hy3 = {
    #  url = "github:outfoxxed/hy3";
    #  inputs.hyprland.follows = "hyprland";
    #};

    # Custom flakes
    game-setting-manager.url = "github:Jozhin-s-Bazhin/game-setting-manager";
    pyprland.url = "github:Jozhin-s-Bazhin/pyprland/flake_application";
  };

  outputs = inputs@{ nixpkgs, home-manager, /*hyprland,*/ ... }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
	      specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.roman = import ./home/home.nix;
	    home-manager.extraSpecialArgs = { inherit inputs; };
	    home-manager.modules = [
	       hyprland.homeManagerModules.default
        {wayland.windowManager.hyprland.enable = true;}
	    ];
          }
        ];
      };
    };
  };
}
