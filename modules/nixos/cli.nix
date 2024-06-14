{ pkgs, ... }:
{
	home = {
		packages = with pkgs; [
			zip
			gzip
			unzip
			nano
			btop
			file
			shotman
			wget
			git
		];
	};
	programs = {
		neovim = {
			enable = true;
		};
	# Configure eza
		eza = {
			enable = true;
			icons = true;
			extraOptions = [
				"--group-directories-first"
				"--header"
				"--tree"
			];
		};
	# Configure fzf
		fzf = {
			enable = true;
		  	defaultOptions = [
				"--preview 'cat {}'"
			];	
		};
	# Configure zellij
		zellij = {
			enable = true;
			enableZshIntegration = true;
		};
	# Configure zsh
		zsh = {
			enable = true;
			autosuggestion.enable = true;
			autocd = true;
			history.ignoreDups = true;
			historySubstringSearch.enable = true;
		};
	};
}
