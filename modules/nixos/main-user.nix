# /etc/nixos/modules/nixos/main-user.nix
{ lib, config, pkgs, ... }:
let
	cfg = config.main-user;
in
{
  options.main-user = {
	enable = lib.mkEnableOption "enable user module";
	userName = lib.mkOption {
		default = "mainuser";
		description = "username";
	};
  };

 config = lib.mkIf cfg.enable {
	users.users.${cfg.userName} = {
		isNormalUser = true;
		initialPassword = "test";
		extraGroups = ["networkmanager" "wheel"];
		description = "user settings";
		shell = pkgs.zsh;
	};
  };
}
