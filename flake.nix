{
  description = "Simple Zig hello world program";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages.default = pkgs.stdenv.mkDerivation {
          pname = "hello-zig";
          version = "0.1.0";

          src = ./.;

          nativeBuildInputs = with pkgs; [ zig ];

          buildPhase = ''
            export ZIG_GLOBAL_CACHE_DIR="$TMPDIR/zig-cache"
            mkdir -p "$ZIG_GLOBAL_CACHE_DIR"
            zig build-exe hello.zig -femit-bin=hello --global-cache-dir "$ZIG_GLOBAL_CACHE_DIR"
          '';

          installPhase = ''
            mkdir -p $out/bin
            cp hello $out/bin/
          '';
        };

        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            zig
          ];

          shellHook = ''
          '';
        };
      });
}