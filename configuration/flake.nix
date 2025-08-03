{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs = {self, nixpkgs, ...}@inputs: {
  nixosConfigurations.nixos-niri = nixpkgs.lib.nixosSystem {
     modules = [ ./configuration.nix ];
     specialArgs = {inherit inputs; };

    };
  };
}
