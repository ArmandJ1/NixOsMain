{ pkgs, ... }:
{
	home = {
		packages = with pkgs; [
			zip
			gzip
			unzip
			neovim
			eza
			wget
			btop
			file
		];
	};
}
