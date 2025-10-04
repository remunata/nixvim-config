{
  description = "Flake for nixvim config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      nixpkgs,
      nixvim,
      utils,
      ...
    }:
    (utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        nixvimModule = {
          inherit pkgs;
          module = import ./config;
        };
        nvim = nixvim.legacyPackages.${system}.makeNixvimWithModule nixvimModule;
      in
      {
        packages.default = nvim;
      }
    ));
}
