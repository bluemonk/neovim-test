{
  description = "Neovim flake test";
  inputs = nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; };

      neovim = pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped {
        luaRcContent = ''
          -- This is the first line of this test
        '';
      };
    in
    {
      packages.x86_64-linux.neovim = neovim;
    };
}
