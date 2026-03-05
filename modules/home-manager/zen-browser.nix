{
  stylix.targets.zen-browser.profileNames = ["marci"];

  programs.zen-browser = {
    enable = true;
    suppressXdgMigrationWarning = true;

    profiles.marci = {
      mods = [
        "f7c71d9a-bce2-420f-ae44-a64bd92975ab" # Better Unloaded Tabs
        "906c6915-5677-48ff-9bfc-096a02a72379" # Floating Status Bar
        "a5f6a231-e3c8-4ce8-8a8e-3e93efd6adec" # Cleaned URL Bar
      ];
    };

    policies = {
      DisablePocket = true;
      DisableTelemetry = true;
      NoDefaultBookmarks = true;
      DontCheckDefaultBrowser = true;
      OfferToSaveLogins = false;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      AutofillCreditCartEnabled = false;
      AutofillAddressEnabled = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
    };
  };
}
