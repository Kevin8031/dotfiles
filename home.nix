{ config, pkgs, ...}:

{
    imports = [ ./home/i3.nix ];

    home.username = "kevin";
    home.homeDirectory = "/home/kevin";
    
    programs.git = {
	enable = true;
	userName = "Kevin8031";
	userEmail = "concilio.kevin@proton.me";
    };

    programs.tmux = {
      enable = true;
      keyMode = "vi";
      terminal = "screen-256color";
      shortcut = "q";
      baseIndex = 1;

      plugins = with pkgs.tmuxPlugins; [
	nord
	resurrect
      ];
    };

    programs.neovim = {
	enable = true;
	defaultEditor = true;
	vimAlias = true;
	viAlias = true;

	extraConfig = ":luafile ~/.config/nvim/init.lua";
    };

    xdg.configFile.nvim = {
       source = ./nvim;
       recursive = true;
    };

    programs.alacritty = {
	enable = true;
	settings = {
	    font = {
		size = 12.0;

		normal = {
		    family = "ProFontIIx Nerd Font Mono";
		    style = "Regular";
		};
	    };
	    # Nord theme
	    colors = {
		primary = {
		    background = "#2e3440";
		    foreground = "#d8dee9";
		};

		normal = {
		    black 	= "#3b4252";
		    red 	= "#bf616a";
		    green	= "#a3be8c";
		    yellow 	= "#ebcb8b";
		    blue 	= "#81a1c1";
		    magenta 	= "#b48ead";
		    cyan 	= "#88c0d0";
		    white 	= "#e5e9f0";
		};

		bright = {
		    black 	= "#4c566a";
		    red 	= "#bf616a";
		    green	= "#a3be8c";
		    yellow 	= "#ebcb8b";
		    blue 	= "#81a1c1";
		    magenta 	= "#b48ead";
		    cyan 	= "#88c0d0";
		    white 	= "#eceff4";
		};
	    };
	};
    };

    programs.zsh = {
	enable = true;
	enableCompletion = true;

	syntaxHighlighting = {
	    enable = true;
	};

	plugins = [
	    {
		name = "powerlevel10k";
		file = "powerlevel10k.zsh-theme";
		src = pkgs.fetchFromGitHub {
		    owner = "romkatv";
		    repo  = "powerlevel10k";
		    rev	  = "v1.20.0";
		    sha256 = "sha256-ES5vJXHjAKw/VHjWs8Au/3R+/aotSbY7PWnWAMzCR8E=";
		};
	    }
	];

	# Load powerlevel10k init file
	initExtra = "if [ -f $HOME/.p10k.zsh ]; then; source $HOME/.p10k.zsh; fi";
    };

    programs.librewolf = {
        enable = true;
    };

    # Version used when last configured
    home.stateVersion = "23.11";
}
