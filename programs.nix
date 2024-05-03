{ config, pkgs, ...}:

{
    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
	git
	gcc
    ];

    programs.neovim = {
	enable = true;
	defaultEditor = true;
	vimAlias = true;
	viAlias = true;

	configure = {
	  customRC = 
	  ''
	    set shiftwidth=4
	  '';
        };
    };
}
