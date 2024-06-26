# /etc/nixos/modules/nixos/font.nix
{ pkgs, ... }:
{
# List fonts installed
 	fonts = {
		enableDefaultPackages = true;
		packages = with pkgs; [
			atkinson-hyperlegible
			hack-font
			nerdfonts
		];
		#fontconfig.defaultFonts = {
		#	serif = [];
		#	sansSerif = [];
		#	monospace = [];
		#};
	};
}
