{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixcord.url = "github:FlameFlag/nixcord";
    stylix = {
      url = "github:danth/stylix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
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
        users.${user} = import module;
        extraSpecialArgs = {inherit user inputs;};
        sharedModules = [
          ./shared/home.nix
          inputs.zen-browser.homeModules.beta
          inputs.nixcord.homeModules.nixcord
          inputs.stylix.homeModules.stylix
        ];
      };
    };
  in {
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit user;};
      modules = [
        ./shared/configuration.nix
        ./laptop/configuration.nix
        (mkHomeManagerModule ./laptop/home.nix)
      ];
    };

    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit user;};
      modules = [
        ./shared/configuration.nix
        ./desktop/configuration.nix
        (mkHomeManagerModule ./desktop/home.nix)
      ];
    };
  };
}
