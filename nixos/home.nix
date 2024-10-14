{ config, pkgs, lib, ... }:
let dmenu = pkgs.dmenu.override( { patches = [ ./patches/center.diff ./patches/gruvbox.diff ]; } );
dwl = pkgs.dwl.override( { conf = ./dwl-conf.h; }  { patches = [./dwl-patch/alwayscenter.patch ./dwl-patch/attachbottom.patch ./dwl-patch/bar.patch ./dwl-patch/autostart.patch]; } );
in 
{
	home.username = "pita";
	home.homeDirectory = "/home/pita";

	home.stateVersion = "24.05"; 

	imports = [ ./configs/init.nix ];

	home.packages = [ dmenu dwl ];
	home.file = {};

	home.sessionVariables = {
		EDITOR = "nvim";
		SHELL = "fish";
	};
	programs = {
		home-manager = {
			enable = true;
		};
	};


	services = {
		dunst = {
			enable = true;
		};
	};


	nixpkgs.config.allowCollisions = true;
	nixpkgs.config.allowUnfree = true;
}
