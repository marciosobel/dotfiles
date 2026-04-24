{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcord = {
      url = "github:FlameFlag/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake/beta";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    user = "marci"; # change if you are adapting this to your own config
    mkHomeManagerModule = module: {
      imports = [home-manager.nixosModules.home-manager];
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        users.${user} = module;
        extraSpecialArgs = {inherit user inputs;};
        sharedModules = [
          ./shared/home.nix
          inputs.zen-browser.homeModules.beta
          inputs.nixcord.homeModules.nixcord
          inputs.stylix.homeModules.stylix
          inputs.niri.homeModules.niri
          inputs.niri.homeModules.stylix
        ];
      };
    };
  in {
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit user;};
      modules = [
        ./shared/configuration.nix
        ./laptop/configuration.nix
        ./laptop/hardware-configuration.nix
        (mkHomeManagerModule (import ./laptop/home.nix))
      ];
    };

    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit user;};
      modules = [
        ./shared/configuration.nix
        ./desktop/configuration.nix
        ./desktop/hardware-configuration.nix
        (mkHomeManagerModule (import ./desktop/home.nix))
      ];
    };
  };
}
