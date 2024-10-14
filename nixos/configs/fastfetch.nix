{ config, ... }:

{
	programs.fastfetch = {
		enable = true;
		settings = {

			logo = {
				source = "nixos_small";
				padding = {
					right = 10;
				};
			};

			display = {
				size = {
					binaryPrefix = "si";
				};
				color = "blue";
				separator = ": ";
			};
			modules = [
				"os"
					"kernel"
					"uptime"
					"packages"
					"shell"
					"terminal"
					"cpu"
			];
			colors = {
				keys = "magenta";
				title = "blue";
			};
		};
	};
}
