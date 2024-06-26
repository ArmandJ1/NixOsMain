{ config, pkgs, ... }:
let
downloadDirectory ="/home/test/Downloads/tmp";
in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "test";
  home.homeDirectory = "/home/test";  

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
	keepassxc
	libreoffice
	vscodium
	mpv
	fuzzel
	mako
	wl-clipboard	
	gimp
	blender	
  ];
  # Configure Sway
  wayland.windowManager.sway = {
	enable = true;
  };
  # Configure Hyprland
  wayland.windowManager.hyprland = {
	enable = true;
	settings = {
		"$mod" = "SUPER";
		"$terminal" = "alacritty";
		"$menu" = "fuzzel";
		bind = [
			"$mod, S, exec, shotman --capture region"
			#"$mod, Return, exec, alacritty"
			"$mod, D, exec, fuzzel"
			"$mod, Z, killall"
		];
	};
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
  # Configure librewolf
  programs.librewolf = {
	enable = true;
	settings = {
		# makes the webpage fit a standerd size
		"privacy.resistFingerprinting.letterboxing" = true;
		# clear you history and downloads on shutdown
		"privacy.clearOnShutdown.history" = true;
		"privacy.clearOnShutdown.downloads" = true;
		# dissable middle mouse button pastting
		"middlemouse.paste" = false;
		# Set the download loacation
		"browser.download.dir" = "${downloadDirectory}";
	};
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
  # Configure zellij
  programs.zellij = {
	enable = true;
	enableZshIntegration = true;
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
