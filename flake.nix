{
  description = " Incredibly fast JavaScript runtime, bundler, test runner, and package manager – all in one";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    zig.url = "github:mitchellh/zig-overlay";

    tools = {
      url = "github:RGBCube/FlakeTools";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, zig, tools }: tools.eachDefaultArch (system: let
    package = nixpkgs.legacyPackages.${system}.callPackage (import ./nix/bun.nix) {
      zig = zig.packages.${system}.default;
    };
  in {
    packages.${system}.bun     = package;
    packages.${system}.default = package;
  });
}
