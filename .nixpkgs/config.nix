{ pkgs }: {
  allowBroken = true;
  allowUnfree = true;
  zathura.useMupdf = true; # disable to use poppler for rendering
  packageOverrides = super: let self = super.pkgs; in
    let inherit (self) stdenv callPackage fetchFromGitHub;
        inherit (stdenv) lib;
        inherit (lib) overrideDerivation concatMapStringsSep;
        wrapVim = callPackage ./vim/wrapper.nix;
    in rec {
      vimHuge = callPackage ./vim/vim.nix { };

      macvimWrapped   = wrapVim { vim = pkgs.macvim; };
      vimHugeWrapped  = wrapVim { vim = vimHuge; };

      vimPlugins = callPackage ./vim-plugins { };

      # expose packages in a `ghcWithPackages` set.
      # https://github.com/NixOS/nixpkgs/pull/5605
      exposePkgs = names: ghcPackages: ghcPackages.overrideDerivation (drv: { postBuild = ''
        ${drv.postBuild}
        ${concatMapStringsSep "\n" (name: "$out/bin/ghc-pkg expose ${name}") names}
      ''; });

      haskellngPackages_7101 = with self.haskell-ng.lib; self.haskell-ng.packages.ghc7101.override {
        overrides = self: super: {
          hdevtools = overrideCabal super.hdevtools (drv: {
            broken = false;
            src = pkgs.fetchFromGitHub {
              owner = "schell";
              repo = "hdevtools";
              rev = "5a946486bb716a34e923cdd47338488c54cb1ba5";
              sha256 = "0vba29dqbr2gjsgv7q11ygw48k1fadv9qrrvpa9rcrm67mgxra1a";
            };
          });

          ghc-mod = overrideCabal super.ghc-mod (drv: {
            broken = false;
            src = pkgs.fetchFromGitHub {
              owner = "DanielG";
              repo = "ghc-mod";
              rev = "247e4e0e7616fe1fecc68fdcf80d6249ac4cee4f";
              sha256 = "02i6z0navp5a73nk9k46rh01hl5r10s6gzq1c6fmcrdrzjq6nwv4";
            };
            buildDepends = drv.buildDepends ++ [ self.cabal-helper self.cereal ];
          });
        };
      };

      withHoogle = haskellEnv:
        self.haskellngPackages.callPackage <nixpkgs/pkgs/development/libraries/haskell/hoogle/local.nix> {
          packages = haskellEnv.paths;
        };
    };
}
