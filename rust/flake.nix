{
  description = "Basic rust environment";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    rust-overlay,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [rust-overlay.overlays.default];
      };
      toolchain = pkgs.rust-bin.fromRustupToolchainFile ./toolchain.toml;
    in {
      devShells.default = pkgs.mkShell {
        packages = [
          toolchain
          pkgs.rust-analyzer-unwrapped
        ];
        RUST_SRC_PATH = "${toolchain}/lib/rustlib/src/rust/library";

        shellHook = ''
          echo "Rust environment active"
          echo "$(rustc --version)"
        '';
      };
    });
}
