{ pkgs, ... }: 
{

	home.packages = [

			pkgs.kitty
			pkgs.foot
			pkgs.xterm
			pkgs.swaynotificationcenter
			pkgs.waybar
			pkgs.gnome.nautilus
			pkgs.swww
			pkgs.rustup
			pkgs.gcc
			pkgs.ghc
			pkgs.haskellPackages.haskell-language-server
			pkgs.gh
			pkgs.clipmenu
			pkgs.xorg.libX11.dev
			pkgs.xorg.libXinerama.dev
			pkgs.xorg.libXft.dev
			pkgs.pkgs.nasm
			pkgs.vesktop
			pkgs.autotiling
			pkgs.gnumake
			pkgs.autoconf
			pkgs.automake
			pkgs.bison
			pkgs.gettext
			pkgs.gperf
			pkgs.libnotify
			pkgs.btop
			pkgs.fastfetch
			pkgs.neovim
			pkgs.firefox
			pkgs.wl-clipboard
			pkgs.fzf
			pkgs.zoxide
			];
}
