{ pkgs, ... }:
{
programs = {
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
	thunderbird = {
		enable = true;
		profiles.default = {
			isDefault = true;
			withExternalGnupg = true;
		};
	};
};
}
