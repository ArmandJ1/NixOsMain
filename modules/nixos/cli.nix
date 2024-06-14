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
	# Configure eza
	programs.eza = {
		enable = true;
		icons = true;
		extraOptions = [
			"--group-directories-first"
			"--header"
			"--tree"
		];
	};
	# Configure fzf
	programs.fzf = {
		enable = true;
	  	defaultOptions = [
			"--preview 'cat {}'"
		];	
	};
	# Configure zellij
	programs.zellij = {
		enable = true;
		enableZshIntegration = true;
	};
	# Configure zsh
	programs.zsh = {
		enable = true;
		autosuggestion.enable = true;
		autocd = true;
		history.ignoreDups = true;
		historySubstringSearch.enable = true;
	};
}
