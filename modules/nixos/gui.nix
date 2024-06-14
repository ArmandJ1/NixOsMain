{ pkgs, ... }:
{
home = {
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
		pulseaudio
		kitty
	];
};
programs = {
# Configure chromium
	chromium = {
		enable = true;
		dictionaries = [
			pkgs.hunspellDictsChromium.en_US
		];
	};

# Configure librewolf
	librewolf = {
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
# Configure thunderbird
	thunderbird = {
		enable = true;
		profiles.default = {
			isDefault = true;
			withExternalGnupg = true;
		};
	};
};
}
