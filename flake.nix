{
  description = "Neovim flake test";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

      neovim = pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped {
        autowrapRuntimeDeps = true;
        viAlias = true;
        vimAlias = true;

        luaRcContent = ''
          -- This is the first line of this test
        '';
      };
    in
    {

      packages.x86_64-linux.neovim = neovim;

      packages.x86_64-linux.default = self.packages.x86_64-linux.neovim;

    };
}
