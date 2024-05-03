{ pkgs, config, ...}:

{
    programs.rofi = {
	enable = true;
	font = "ProFontIIx Nerd Font Mono 12";
	location = "center";
	terminal = "alacritty";
	plugins = with pkgs; [ rofi-calc ];
	theme = "custom";

	extraConfig = {
	    combi-modi = "drun,run,window,ssh";
	    modi = "run,window,ssh";
	    line-margin = 10;
	    show-icons = true;

	    display-ssh =    "";
	    display-run =    "";
	    display-drun =   "";
	    display-window = "";
	    display-combi =  "";
	    ssh-client =     "ssh";
	    ssh-command =    "{terminal} -e {ssh-client} {host} [-p {port}]";
	    run-command =    "{cmd}";
	    run-shell-command = "{terminal} {cmd}";
	};
    };

    xdg.dataFile."rofi/themes/custom.rasi".source = ../rofi/nord.rasi;
}
