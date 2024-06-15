# /etc/nixos/hosts/vm/configuration.nix

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
	./hardware-configuration.nix
	inputs.home-manager.nixosModules.default
	# Other modules
	../../modules/nixos/main-user.nix
	../../modules/nixos/greetd.nix
	../../modules/nixos/local.nix
    ];

  # Bootloader.
  boot.loader.grub = {
  	enable = true;
  	device = "/dev/sda";
  	useOSProber = true;
  };

  # Networking options
  networking = {
	hostName = "nixos"; # Define your hostname.
	networkmanager.enable = true; # enable networkManager
	firewall = {
		enable =true; #trun on the firewall
		# allowedTCPPorts = [ ];
  	};
  };

  # Enable bluetooth
  hardware.bluetooth.package = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n = {
	defaultLocale = "en_US.UTF-8";
	extraLocaleSettings = {
		LC_ADDRESS = "en_US.UTF-8";
		LC_IDENTIFICATION = "en_US.UTF-8";
		LC_MEASUREMENT = "en_US.UTF-8";
		LC_MONETARY = "en_US.UTF-8";
		LC_NAME = "en_US.UTF-8";
		LC_NUMERIC = "en_US.UTF-8";
		LC_PAPER = "en_US.UTF-8";
		LC_TELEPHONE = "en_US.UTF-8";
		LC_TIME = "en_US.UTF-8";
  	};
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Set the Main User
  main-user = {
	enable = true;
	userName = "alex";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List fonts installed
  fonts = {
	enableDefaultPackages = true;
	packages = with pkgs; [
		atkinson-hyperlegible
		hack-font
	];
	#fontconfig.defaultFonts = {
	#	serif = [];
	#	sansSerif = [];
	#	monospace = [];
	#};
  };

  # Enable hyprland
  programs.hyprland = {
	enable = true;
	xwayland.enable = true;
  };

  # Enable zsh
  programs.zsh.enable = true;

  # Enable and set location of home.nix
  home-manager = {
	extraSpecialArgs = {inherit inputs;};
	users = {
		"alex" = import ./home.nix;
  	};
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  # services.openssh.settings.PasswordAuthentication = true; #delete after first use
  # networking.firewall.allowedTCPPorts = [ 22 ];

  # Setup flakes and nix command
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
