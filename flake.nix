{
  description = "Flake to build and develop Nyxi";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, flake-utils, nixpkgs }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = (import nixpkgs) {
          inherit system;
        };

      in rec {

        # For `nix develop`
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [ zola ];
          shellHook = ''
            git submodule update --init --recursive
            zola serve
          '';
        };
      }
    );
}

