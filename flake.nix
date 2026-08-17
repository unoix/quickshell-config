{
	description = "Quickshell niggaconfig";
	
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.folows = "nixpkgs";
		};
	};

	outputs = { self, home-manager, ... }: {
		homeManagerModules.default = import ./module.nix;
	};
}
