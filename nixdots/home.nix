{ config, pkgs, ... }:

{
    imports = [
	./modules/git.nix
	./modules/waybar.nix
    ];
    home.username = "jawknee";
    home.homeDirectory = "/home/jawknee";

    #this determines the home manager release that the configuration is compatible with
    #leave it as it is, even if you update Nix later.
    home.stateVersion = "23.11";

    #declarative package mamagement
    home.packages = with pkgs; [
        #core utilities
        git
        fastfetch
        ripgrep

        #webdev essentials
        #nodejs_20
        #nodePackages.npm
        #nodePackages.typescript

        #wayland essentials
        wl-clipboard
        wayland-utils

        #waybar dependencies
        font-awesome #for icons in the waybar
        pavucontrol #gui volume control when audio module clicked in waybar
        brightnessctl #for brightness
        networkmanagerapplet #nm-applet in the tray
        #the clipboard
        cliphist #clipboard daemon
        fuzzel #wayland app launcher (used to display clipboard history)


    ];

    #managing dotfiles: instead of manually editing ~/.config/niri/config.kdl, Nix generates and symlinks it.
    xdg.configFile."niri/config.kdl".text = ''
        //this config is managed by the Nix Home Manager

        //waybar autostart
        //spawn-at-startup "waybar"

        //space for keybinds and window rules

        '';

    #native program configurtaion
    
    #Git configuration
    programs.git = {
        enable = true;
        userName = "nirmanshandilya";
        userEmail = "nirmanshandilya.oc@gmail.com";
    };

    #Home Manager installs and manages itself
    programs.home-manager.enable = true;
}
