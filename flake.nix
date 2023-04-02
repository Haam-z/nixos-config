{
  description = "A very simpel nixos flake based configuration ";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    selena.url = "github:Haam-z/selena";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hardware.url = "github:nixos/nixos-hardware";
  };
  outputs =
    { self, selena, nixpkgs, home-manager, hyprland, hardware, ... }@inputs:
    let
      system = "x86_64-linux";
      inherit (self) outputs;
    in {
      nixosConfigurations = {
        lenovo = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ ./system/lenovo ];
        };
      };
      homeConfigurations = {
        haam = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [ ./home/haam ];
        };
      };
    };
}
