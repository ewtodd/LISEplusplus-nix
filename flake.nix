{
  description = "LISE++ flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
        lisepp = pkgs.callPackage ./default.nix { };
      in
      {
        packages = {
          default = lisepp;
        };
      }
    );
}
