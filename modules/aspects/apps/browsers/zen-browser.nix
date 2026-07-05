{
  inputs,
  system,
  ...
}: {
  den.aspects.apps.browsers.zen-browser = {
    homeManager = let
      zen-browser = inputs.zen-browser.packages.${system}.beta;

      mkExtensionSettings = builtins.mapAttrs (_: pluginId: {
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/${pluginId}/latest.xpi";
        installation_mode = "force_installed";
      });

      # use schema `{ <extension-ID> = <extension-name> }`
      extensions = mkExtensionSettings {
        "addon@darkreader.org" = "darkreader";
        "78272b6fa58f4a1abaac99321d503a20@proton.me" = "proton-pass";
        "uBlock0@raymondhill.net" = "ublock-origin";
        # "com.program1519.youtube.removeborder@example.com" = "youtube-remove-border-radius";
        "myallychou@gmail.com" = "youtube-recommended-videos"; # Unhook
        "clipper@obsidian.md" = "web-clipper-obsidian";
      };

      zenIcon = name: "chrome://browser/skin/zen-icons/selectable/${name}.svg";
    in {
      imports = [inputs.zen-browser.homeModules.beta];
      stylix.targets.zen-browser.profileNames = ["marci"];

      programs.zen-browser = {
        enable = true;

        setAsDefaultBrowser = true;

        profiles.marci = rec {
          mods = let
            zenMods = {
              betterUnloadedTabs = "f7c71d9a-bce2-420f-ae44-a64bd92975ab";
              floatingStatusBar = "906c6915-5677-48ff-9bfc-096a02a72379";
              cleanedURLBar = "a5f6a231-e3c8-4ce8-8a8e-3e93efd6adec";
              noHighlightSplit = "f50841b2-5e4a-4534-985d-b7f7b96088c2";
            };
          in [
            zenMods.betterUnloadedTabs
            zenMods.cleanedURLBar
            zenMods.floatingStatusBar
            zenMods.noHighlightSplit
          ];

          settings = {
            "media.videocontrols.picture-in-picture.video-toggle.enabled" = false;
            "browser.tabs.hoverPreview.enabled" = true;

            "zen.urlbar.behavior" = "float";
            "zen.workspaces.separate-essentials" = false;
            "zen.tabs.vertical.right-side" = true;
            "zen.welcome-screen.seen" = true;
          };

          containersForce = true;
          containers = {
            personal = {
              color = "blue";
              icon = "circle";
              id = 1;
            };
            work = {
              color = "orange";
              icon = "circle";
              id = 2;
            };
          };

          spacesForce = true;
          spaces = {
            personal = {
              id = "de7d131e-3288-4f6d-be4c-98fe7b93b452";
              name = "euu :3";
              position = 1000;
              icon = zenIcon "heart";
              container = containers.personal.id;
            };
          };

          pinsForce = true;
          pins = {
            "TIDAL" = {
              id = "e5c33780-4888-4a16-85e7-a011a3cdd2c6";
              url = "https://tidal.com/";
              isEssential = true;
              container = containers.personal.id;
              position = 100;
            };
            "Proton Pass" = {
              id = "62a365f0-ce35-49b1-a49a-da7463b7ac98";
              url = "https://pass.proton.me/";
              workspace = spaces.personal.id;
              position = 201;
            };
            "Proton Mail" = {
              id = "be358c6a-d206-4e5d-b6af-a26edecbc767";
              url = "https://mail.proton.me/";
              workspace = spaces.personal.id;
              position = 202;
            };
            "Ente Auth" = {
              id = "811914db-f4f8-4436-9081-1d074134566c";
              url = "https://auth.ente.io/auth";
              workspace = spaces.personal.id;
              position = 203;
            };
            "WhatsApp" = {
              id = "13f437da-1564-4ba4-99dc-dd96da61c6fc";
              url = "https://web.whatsapp.com/";
              workspace = spaces.personal.id;
              position = 204;
            };
          };
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
          ExtensionSettings = extensions;
          EnableTrackingProtection = {
            Value = true;
            Locked = true;
            Cryptomining = true;
            Fingerprinting = true;
          };
        };
      };

      xdg.mimeApps = let
        value = zen-browser.meta.desktopFileName;
        associations = builtins.listToAttrs (map (name: {inherit name value;}) [
          "application/x-extension-shtml"
          "application/x-extension-xhtml"
          "application/x-extension-html"
          "application/x-extension-xht"
          "application/x-extension-htm"
          "x-scheme-handler/unknown"
          "x-scheme-handler/mailto"
          "x-scheme-handler/chrome"
          "x-scheme-handler/about"
          "x-scheme-handler/https"
          "x-scheme-handler/http"
          "application/xhtml+xml"
          "application/json"
          "text/plain"
          "text/html"
        ]);
      in {
        associations.added = associations;
        defaultApplications = associations;
      };
    };
  };
}
