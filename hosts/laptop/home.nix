{ config, pkgs, ... }:
let
downloadDirectory ="/home/alex/Downloads/tmp";
in
{
home = {
  username = "alex";
  homeDirectory = "/home/alex";  

  stateVersion = "23.11"; # Please read the comment before changing.
  packages = with pkgs; [
	keepassxc
	libreoffice
	vscodium
	mpv
	fuzzel
	mako
	wl-clipboard	
	dolphin

	gimp
	blender	
  ];
};
imports = {
	# Configure Hyprland
	../../modules/nixos/hypr.nix
	# Configure librewolf
	../../modules/nixos/librewolf.nix
	# Configure cli
	../../modules/nixos/cli.nix
};

  # Configure Sway
  wayland.windowManager.sway = {
	enable = true;
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
 
  # Configure chromium
  programs.chromium = {
	enable = true;
	dictionaries = [
		pkgs.hunspellDictsChromium.en_US
	];
  };
  # Configure zsh
  programs.zsh = {
	enable = true;
	autosuggestion.enable = true;
	autocd = true;
	history.ignoreDups = true;
	historySubstringSearch.enable = true;
	
 };
  # Configure alacritty
  programs.alacritty = {
	enable = true;
  };
  # Configure fzf
  programs.fzf = {
	enable = true;
  	defaultOptions = [
		"--preview 'cat {}'"
	];	
  };



  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/root/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
