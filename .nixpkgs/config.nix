{ pkgs }: {
  allowUnfree = true;
  zathura.useMupdf = true; # disable to use poppler for rendering
  packageOverrides = super: let self = super.pkgs; in
    let inherit (self) stdenv callPackage fetchFromGitHub;
        inherit (stdenv) lib;
        inherit (lib) overrideDerivation;
        wrapVim = callPackage ./vim/wrapper.nix;
        haskExt = self: super: {
          #systemFileio = self.disableTest  super.systemFileio;
          #shake        = self.disableTest  super.shake;
          #unlambda     = self.disableLinks super.unlambda;
        };
    in rec {
      macvim  = overrideDerivation super.macvim (oldAttrs: {
        name = "macvim-7.4.355";
        src = fetchFromGitHub {
          owner = "genoma";
          repo = "macvim";
          rev = "c18a61f9723565664ffc2eda9179e96c95860e25";
          sha256 = "190bngg8m4bwqcia7w24gn7mmqkhk0mavxy81ziwysam1f652ymf";
        };
      });
      vimHuge = callPackage ./vim/vim.nix { };

      macvimWrapped   = wrapVim { vim = macvim; };
      vimHugeWrapped  = wrapVim { vim = vimHuge; };

      vimPlugins = callPackage ./vim-plugins { };

      #haskellPackages_ghc783 = self.haskellPackages.override {
      #  extension = haskExt;
      #};
    };
}
