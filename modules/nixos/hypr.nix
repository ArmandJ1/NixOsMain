{ pkgs, ... }:
{
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
}
