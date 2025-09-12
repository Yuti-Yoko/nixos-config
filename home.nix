{pkgs, ...}: {
  imports = [
    ./modules/home/zed.nix
    ./modules/home/zsh.nix
    #./home/modules/alacritty.nix
    #./modules/home/terminal.nix
  ];
  # TODO please change the username & home directory to your own
  home.username = "ilumix";
  home.homeDirectory = "/home/ilumix";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # set cursor size and dpi for 4k monitor
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them

    telegram-desktop
    thunderbird
    inetutils
    obsidian
    spotify
    discord
    vscode
    osu-lazer
    alejandra
    floorp
    termius
    ifuse
  ];
  home.stateVersion = "25.05";
}
