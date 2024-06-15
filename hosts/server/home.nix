/etc/nixos/hosts/server/home.nix
{ config, pkgs, ... }:
let
downloadDirectory ="/home/alex/Downloads/tmp";
in
{
home = {
	username = "alex";
	homeDirectory = "/home/alex";  
	sessionVariables = {
		EDITOR = "nvim";
		VISUAL = "nvim";
	};
	stateVersion = "23.11"; # Please read the comment before changing.
};
imports = {
	# Configure Hyprland
	../../modules/nixos/hypr.nix
	# Configure librewolf
	../../modules/nixos/gui.nix
	# Configure cli
	../../modules/nixos/cli.nix
};
# Let Home manager manage itself
programs.home-manager.enable = true;
}
