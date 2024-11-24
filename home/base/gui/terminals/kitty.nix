{
  lib,
  pkgs,
  ...
}: {
  programs.kitty = {
    enable = true;
    themeFile = "gruvbox-dark";
    font = {
      name = "IosevkaTermSlab Nerd Font Mono";
      size = 20;
    };

    keybindings = {
      "cmd+n" = "new_os_window";
      "cmd+equal" = "change_font_size all +2.0";
      "ctrl+cmd+f" = "toggle_fullscreen";
      "cmd+w" = "close_window";
      "cmd+q" = "close_window";
    };

    settings = {
      clear_all_shortcuts = true;
      # Performance Tuning
      input_delay = 0;
      sync_to_monitor = 0;
      # Window Appearance
      window_margin_width = 50;
      hide_window_decorations = "titlebar-only";
      # MacOS Tweaks
      macos_option_as_alt = true;
      macos_quit_when_last_window_closed = true;
      shell = "${pkgs.bash}/bin/bash --login -c 'nu --login --interactive'";
    };
  };
}
