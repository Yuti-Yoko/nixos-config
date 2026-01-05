{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-25.05 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = input @ {
    nixpkgs,
    home-manager,
    nixos-hardware,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {
    devShells.${system}.default = import ./shell.nix {inherit pkgs input;};

    nixosConfigurations = {
      ilumix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/ilumix/configuration.nix
          nixos-hardware.nixosModules.lenovo-thinkpad-t480s
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.ilumix = ./home.nix;
              backupFileExtension = "backup";
            };
          }
        ];
      };
    };
  };
}
