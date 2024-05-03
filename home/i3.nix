{ config, pkgs, lib, ... }:

let
    mod = "Mod1";
in {
    imports = [ ./rofi.nix ];

    # i3 config
    xsession.windowManager.i3 = {
	enable = true;
	config = { 
	    modifier = mod;

	    fonts = {
		names = [ "ProFontIIx Nerd Font Mono" ];
		size = 8.0;
	    };

	    menu = "${pkgs.rofi}/bin/rofi -show combi -lines 10";

	    keybindings =
	    let
		modifier = config.xsession.windowManager.i3.config.modifier;
	    in lib.mkOptionDefault {
		# Rofi calc
		"${modifier}+Shift+d" = "${pkgs.rofi}/bin/rofi -show calc -modi calc -lines 10";

	        # Focus
		"${modifier}+h" = "focus left";
		"${modifier}+l" = "focus right";
		"${modifier}+j" = "focus down";
		"${modifier}+k" = "focus up";

		# Move window around
		"${modifier}+Shift h" = "move left";
		"${modifier}+Shift l" = "move right";
		"${modifier}+Shift j" = "move down";
		"${modifier}+Shift k" = "move up";

		# Media Keybindings
	        "XF86AudioRaiseVolume" 	= "exec ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ +5%";
	        "XF86AudioLowerVolume" 	= "exec ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ -5%";
	        "XF86AudioMute" 	= "exec ${pkgs.pulseaudio}/bin/pactl set-sink-mute @DEFAULT_SINK@ toggle";
	        "XF86AudioMicMute" 	= "exec ${pkgs.pulseaudio}/bin/pactl set-sink-mute @DEFAULT_SOURCE@ toggle";

	        "XF86AudioPlay" 	= "exec ${pkgs.playerctl}/bin/playerctl play-pause";
	        "XF86AudioNext" 	= "exec ${pkgs.playerctl}/bin/playerctl next";
	        "XF86AudioPrev" 	= "exec ${pkgs.playerctl}/bin/playerctl previous";

		# Brightness control
	        "XF86MonBrightnessUp" 	= "exec ${pkgs.light}/bin/light -A 1";
	        "XF86MonBrightnessDown"	= "exec ${pkgs.light}/bin/light -U 1";
	    };

	    modes = {
		"resize" = {
		    h = "resize shrink width 10px or 10 ppt";
		    j = "resize grow height 10px or 10 ppt";
		    k = "resize shrink height 10px or 10 ppt";
		    l = "resize grow width 10px or 10 ppt";

		    Return = "mode default";
		    Escape = "mode default";
		};
	    };

	    startup = [
		{ command = "${pkgs.dunst}/bin/dunst"; }
	    ];

	    bars = [{
		position = "bottom";
		statusCommand = "${pkgs.i3status}/bin/i3status";
		
		colors = {
		    separator 	= "#1f222d";
		    background 	= "#1f222d";
		    statusline 	= "#81a1c1";

		    focusedWorkspace = {
			border	= "#1f222d";
			background 	= "#1f222d";
			text	= "#81a1c1";
		    };

		    activeWorkspace = {
			border	= "#1f222d";
			background 	= "#252936";
			text	= "#5e81ac";
		    };

		    inactiveWorkspace = {
			border	= "#1f222d";
			background 	= "#1f222d";
			text	= "#4c566a";
		    };

		    urgentWorkspace = {
			border	= "#1f222d";
			background 	= "#1f222d";
			text	= "#ee829f";
		    };

		    bindingMode = {
			border	= "#1f222d";
			background 	= "#81a1c1";
			text	= "#2e3440";
		    };
		};
	    }];

	    terminal = "alacritty";
	};
    };

    programs.i3status = {
	enable = true;
	enableDefault = false;

	general = {
	    colors = true;
	    interval = 1;
	    color_good = "#81a1c1";
	    color_degraded = "#fafe7c";
	    color_bad = "#ff7770";
	};

	modules = {
	    "volume master" = {
		position = 1;
		settings = {
		    format = " %volume";
		    format_muted = " %volume";
		    device = "default";
		    mixer = "Master";
		    mixer_idx = 0;
		};
	    };

	    "ethernet first" = {
		position = 2;
		settings = {
		    format_up = "E: %ip (%speed)";
		    format_down = "E: down";
		};
	    };

	    "battery 0" = {
		position = 3;
		settings = {
		    format = "%status %percentage";
		    hide_seconds = true;
		    integer_battery_capacity = true;
		    last_full_capacity = true;
		    status_chr = " +";
		    status_bat = "";
		    status_full = "";
		};
	    };

	    "load" = {
		position = 4;
		settings = {
		    format = "CPU: %1min";
		};
	    };

	    "tztime local" = {
		position = 5;
		settings = {
		    format = "   %a %d-%m-%Y    %H:%M:%S  ";
		};
	    };
	};
    };

    # xdg.configFile.".local/share/rofi/themes/custom.css" = {}
}
