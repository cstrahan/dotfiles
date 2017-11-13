{ stdenv, lib, pkgs, callPackage
, fetchzip, fetchgit
, cmake
, vim, ruby, python, perl, llvmPackages
, which
, darwin
, ycmd
}:
let sourcesJson = builtins.fromJSON (builtins.readFile ./sources.json);
    sources = lib.foldl' (acc: x: acc // {
      "${x.name}" = pkgs.fetchFromGitHub { inherit (x) owner repo rev sha256; };
    }) { } sourcesJson;
    vimHelpTagsDef = ''
      vimHelpTags(){
        if [ -d "$1/doc" ]; then
          ${vim}/bin/vim -n -u NONE -i NONE -n -e -s -c "helptags $1/doc" +quit! ||
            echo "WARNING: could not generate helpdocs for $name"
        fi
      }
    '';
    mkVimPlugin = name: src: stdenv.mkDerivation {
      inherit name src;
      preConfigure = ''
        if [[ -f Makefile ]]; then
          rm Makefile
        fi
      '';
      installPhase = ''
        mkdir -p $out/vim-plugins
        target=$out/vim-plugins/$name
        cp -r . $target
        ${vimHelpTagsDef}
        vimHelpTags $target
      '';
    };
    plugins = lib.mapAttrs mkVimPlugin sources // {
      youcompleteme = stdenv.mkDerivation {
        name = "youcompleteme";
        src = fetchgit {
          url = "https://github.com/Valloric/YouCompleteMe.git";
          sha256 = "0b8r8jrsipp2cf1j5i55czzhgvyhvvd2cwr08ya2rwhix0nblczw";
          rev = "c881441385ea95d6ac8051593406c1c78d373329";
        };
        patchPhase = ''
          substituteInPlace plugin/youcompleteme.vim --replace \
            "'ycm_path_to_python_interpreter', '''" \
            "'ycm_path_to_python_interpreter', '${python}/bin/python'"
        '';
        configurePhase = "true";
        buildPhase = ''
          rm -r third_party/ycmd
          ln -s ${ycmd}/lib/ycmd third_party
        '';
        installPhase = ''
          mkdir -p $out/vim-plugins
          target=$out/vim-plugins/$name
          cp -a ./ $target
          ${vimHelpTagsDef}
          vimHelpTags $target
        '';
        meta = with lib; {
          description = "Fastest non utf-8 aware word and C completion engine for Vim";
          homepage    = http://github.com/Valloric/YouCompleteMe;
          license     = licenses.gpl3;
          platforms   = platforms.unix;
        };
      };
      vimproc = stdenv.mkDerivation {
        name = "vimproc";
        meta = with lib; {
          description = "An asynchronous execution library for Vim";
          homepage    = https://github.com/Shougo/vimproc.vim;
          license     = licenses.gpl3;
          maintainers = with maintainers; [ cstrahan ];
          platforms   = platforms.unix;
        };
        src = sources.vimproc;
        buildInputs = [ which ];
        buildPhase = if stdenv.isLinux then ''
          make -f make_unix.mak
        '' else ''
          make -f make_mac.mak
        '';
        installPhase = ''
          ensureDir $out/vim-plugins
          target=$out/vim-plugins/$name
          cp -a ./ $target
          ${vimHelpTagsDef}
          vimHelpTags $target
        '';
      };
      command-t = stdenv.mkDerivation {
        name = "command-t";
        src = sources.command-t;
        buildInputs = [ perl ruby darwin.libobjc ];
        buildPhase = ''
          pushd ruby/command-t/ext/command-t
          ruby extconf.rb
          make
          popd
        '';
        installPhase = ''
          ensureDir $out/vim-plugins
          target=$out/vim-plugins/$name
          cp -a ./ $target
          ${vimHelpTagsDef}
          vimHelpTags $target
        '';
      };
    };
in plugins
