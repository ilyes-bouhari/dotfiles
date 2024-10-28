{ lib, config, pkgs, ... }:

{
  environment = {
    darwinConfig = "$HOME/dotfiles/darwin";
    systemPackages = [
      pkgs.home-manager
      pkgs.ngrok
    ]; 
  };

  # environment.shells = [pkgs.fish pkgs.zsh];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nixpkgs.config.allowUnfree = true;

  nix = {
    package = pkgs.nix;
    settings = {
      auto-optimise-store = true;
      builders-use-substitutes = true;
      experimental-features = ["flakes" "nix-command"];
      substituters = ["https://nix-community.cachix.org"];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      trusted-users = ["root" "ilyes" "@wheel"];
      warn-dirty = false;
    };
    gc = {
      automatic = true;
      interval = { Weekday = 0; Hour = 0; Minute = 0; };
      options = "--delete-older-than 30d";
    };
  };

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs = {
    zsh.enable = true;
  };

  programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  # TODO: pass username as variable
  # users.knownUsers = ["ilyes"];
  # users.users.ilyes.uid = 501;
  users.users.ilyes.home = "/Users/ilyes";
  # users.users.ilyes.shell = pkgs.fish;

  homebrew = {
    enable = true;

    taps = [
      "gromgit/homebrew-fuse"
    ];

    brews = [
      "ntfs-3g-mac"
    ];

    casks = [
      "google-chrome"
      "visual-studio-code"
      "the-unarchiver"
      "rectangle"
      "stats"
      "macfuse"
      "mounty"
      "transmission"
      "obsidian"
      
      # "utm"
      # "monitorcontrol"
    ];

    masApps = {
      "Bandwidth+" = 490461369;
    };
  };

  system = {
    defaults = {
      dock = {
        autohide = false;
        orientation = "bottom";
        show-process-indicators = false;
        show-recents = false;
        static-only = false;
        persistent-apps = [
          "/Applications/Google Chrome.app/"
          "/Applications/Visual Studio Code.app/"
          "/System/Applications/Utilities/Terminal.app"
          "/Applications/Obsidian.app"
        ];
      };
      finder = {
        AppleShowAllExtensions = true;
        ShowPathbar = true;
        ShowStatusBar = true;
      };
    };
  };
}
