# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by runnin
		{ config, pkgs, inputs, lib, ...}:
		let dmenu = pkgs.dmenu.override( { patches = [ ./patches/center.diff ./patches/gruvbox.diff ]; } );
		in{
		boot.loader.grub = {
		enable = true;
		efiSupport = true;
		device = "nodev";
		};
		boot.loader.efi.canTouchEfiVariables = true;

		imports =
		[ 
		./hardware-configuration.nix
		inputs.home-manager.nixosModules.default
		];


		stylix.enable = true;

		stylix = {
			autoEnable = true;
			base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
			image = ./configs/wallpaper5.jpg;
			polarity = "dark";
			fonts = {
				sizes = {
					terminal = 14;

				};
				monospace = {
					name = "JetBrainsMono Nerd Font";
					package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
				};
				sansSerif = {
					name = "JetBrainsMono Nerd Font";
					package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
				};
				serif = {
					name = "JetBrainsMono Nerd Font";
					package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
				};
			};

		};



		home-manager = {
			extraSpecialArgs = { inherit inputs; };
			users = {
				"pita" = import ./home.nix;
			};
		};

		programs.fish.enable = true;
		programs.firefox.enable = true;
		users.users.pita = {

			shell = pkgs.fish;
		};
		fonts = {
			packages = with pkgs; [
				(nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
					dmenu
			];
			fontconfig.enable = true;
		};

		hardware.enableAllFirmware = true;

		boot.extraModprobeConfig = ''
			options snd-intel-dspcfg dsp_driver=1
			'';


		systemd.tmpfiles.rules = [
			"d /var/empty/local/share/man/man1 0755 root root -"
		];



		nix = {
			settings = {
				auto-optimise-store = true;
				experimental-features = ["nix-command" "flakes"];
			};
		};


# Bootloader.

		networking.hostName = "nixos";# Define your hostname.
# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

# Configure network proxy if necessary
# networking.proxy.default = "http://user:password@proxy:port/";
# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

# Enable networking
			networking.networkmanager.enable = true;

# Set your time zone.
		time.timeZone = "Asia/Jerusalem";

# Select internationalisation properties.
		i18n.defaultLocale = "en_IL";

		i18n.extraLocaleSettings = {
			LC_ADDRESS = "he_IL.UTF-8";
			LC_IDENTIFICATION = "he_IL.UTF-8";
			LC_MEASUREMENT = "he_IL.UTF-8";
			LC_MONETARY = "he_IL.UTF-8";
			LC_NAME = "he_IL.UTF-8";
			LC_NUMERIC = "he_IL.UTF-8";
			LC_PAPER = "he_IL.UTF-8";
			LC_TELEPHONE = "he_IL.UTF-8";
			LC_TIME = "he_IL.UTF-8";
		};

# Configure keymap in X11

# Define a user account. Don't forget to set a password with ‘passwd’.
		users.users.pita = {
			isNormalUser = true;
			description = "pita";
			extraGroups = [ "networkmanager" "wheel" "audio" "input" ];
			packages = with pkgs; [];
		};

# Allow unfree packages
		nixpkgs.config.allowUnfree = true;

# List packages installed in system profile. To search, run:
# $ nix search wget
		environment.systemPackages = with pkgs; [
			wget  
				clang 
				clang-tools
				git
				xorg.libX11
		];


# environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw 
# 	services.xserver = {
# 		enable = true;
#
# 		desktopManager = {
# 			xterm.enable = false;
# 		};
#
# 		displayManager = {
# 			defaultSession = "none+i3";
# 		};
#
# 		windowManager.i3 = {
# 			enable = true;
# 			extraPackages = with pkgs; [
# 				i3status # gives you the default i3 status bar
# 					i3lock #default i3 screen locker
# 					i3blocks #if you are planning on using i3blocks over i3status
# 			];
# 		};
# 	};

		hardware = {
			opengl.enable = true;
			nvidia.modesetting.enable = true;
		};

# services.xserver = {
#  enable = true;
#
#  desktopManager = {
#   xterm.enable = false;
#  };
#  displayManager = {
#   defaultSession = "none+i3";
#  };
#  windowManager.i3 = {
#   enable = true;
#   extraPackages = with pkgs; [
# 	  dmenu
# 		  i3status
# 		  i3lock
# 		  i3blocks
#   ];
#  };
# };



		hardware.pulseaudio.enable = false;
		security.rtkit.enable = true;
		services.pipewire = {
			enable = true;
			alsa.enable = true;
			alsa.support32Bit = true;
			pulse.enable = true;
		};


# Some programs need SUID wrappers, can be configured further or are
# started in user sessions. programs.mtr.enable = true; programs.gnupg.agent = { enable = true; enableSSHSupport = true;
# };

# List services that you want to enable:

# Enable the OpenSSH daemon.
# services.openssh.enable = true;

# Open ports in the firewall.
# networking.firewall.allowedTCPPorts = [ ... ];
# networking.firewall.allowedUDPPorts = [ ... ];
# Or disable the firewall altogether.
# networking.firewall.enable = false;

# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It‘s perfectly fine and recommended to leave
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
		system.stateVersion = "24.05"; # Did you read the comment?

		}
