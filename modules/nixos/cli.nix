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
	# Configure zellij
	programs.zellij = {
		enable = true;
		enableZshIntegration = true;
	};
}
