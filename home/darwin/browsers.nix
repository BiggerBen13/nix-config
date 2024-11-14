{...}: {
  programs = {
    # Somehow neither are available on arm
    firefox = {
      enable = true;
      package = null;
      policies = {
        Cookies = {
          Behavior = "reject";
        };
        DisablePocket = true;
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
      };
    };
    # librewolf = {
    #   enable = true;
    #   package = null;
    # };
  };
}
