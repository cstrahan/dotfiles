{ pkgs }: {
  allowBroken = true;
  allowUnfree = true;
  zathura.useMupdf = true; # disable to use poppler for rendering

  firefox = {
   enableGoogleTalkPlugin = true;
   enableAdobeFlash = true;
   enableAdobeFlashDRM = true;
   jre = false;
   icedtea = true;
  };
  chromium = {
   enablePepperFlash = true;
   enableWideVine = true;
  };

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
    };
}
