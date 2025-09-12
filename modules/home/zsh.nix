{pkgs, ...}: {
  config = {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;

      # Alias
      shellAliases = {
        cat = "bat";
        gs = "git status";
      };

      # Oh My Zsh
      ohMyZsh = {
        enable = true;
      };
    };

    # Users default shell
    users.defaultUserShell = pkgs.zsh;
  };
}
