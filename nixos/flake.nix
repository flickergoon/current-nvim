{
	description = "Nixos config flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		stylix.url = "github:danth/stylix";
		xremap-flake.url = "github:xremap/nix-flake";
	};

	outputs = { self, nixpkgs, ... }@inputs:
# let
# 	system = "x86_64-linux";
# 	pkgs = nixpkgs.legacyPackages.${system};
# in
	{
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			specialArgs = {inherit inputs;};
			modules = [
				./configuration.nix
					inputs.home-manager.nixosModules.default
					inputs.stylix.nixosModules.stylix
			];
		};
	};
}
