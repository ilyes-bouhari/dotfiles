{ pkgs, ... }:

{
  home = {
    stateVersion = "24.05";

    packages = [
      pkgs.devenv
    ];
  };

  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;

    git = {
      enable = true;
      userName = "ilyes-bouhari";
      userEmail = "lyesbouhari16@gmail.com";
      ignores = [
        ".DS_Store"
        # add more...
      ];
      extraConfig = {
        init.defaultBranch = "main";
        push.autoSetupRemote = true;
      };
    };

    zsh = {
      enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;

      oh-my-zsh = {
        enable = true;
        plugins = ["git" "z"];
        theme = "robbyrussell";
      };

      syntaxHighlighting = {
        enable = true;
      };
    };


    fish = {
      enable = true;
    };

    direnv = {
      enable = true;

      nix-direnv.enable = true;
    };
  };
}