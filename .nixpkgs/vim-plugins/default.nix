{ stdenv, lib, pkgs, callPackage
, fetchzip, fetchgit
, cmake
, vim, ruby, python, perl, llvmPackages
, which
, darwin
}:
let sources = with pkgs; import ./sources.nix {
      inherit fetchFromGitHub;
    };
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
          rev = "ede37d02313d905c2415cb2f3e0fd71c91fa0741";
          sha256 = "047xzqvchr0y62qf5mfqv6ixffl6m0qzfhl91azpjb6ifz5gh4a3";
        };
        buildInputs = [ python cmake ] ++ lib.optionals stdenv.isLinux [
          llvmPackages.clang-unwrapped
          llvmPackages.llvm
        ];
        patchPhase = ''
          substituteInPlace plugin/youcompleteme.vim --replace \
            "'ycm_path_to_python_interpreter', '''" \
            "'ycm_path_to_python_interpreter', '${python}/bin/python'"
        '';
        configurePhase = ''
          pythonLib=$(find ${python}/lib -name lib${python.libPrefix}.so -o -name lib${python.libPrefix}.dylib)
          pythonInclude=${python}/include/${python.libPrefix}

          cmakeFlagsArray=(
            "-DUSE_SYSTEM_LIBCLANG=ON"
            "-DUSE_CLANG_COMPLETER=ON"
            "-DPYTHON_LIBRARY=$pythonLib"
            "-DPYTHON_INCLUDE_DIR=$pythonInclude"
          )
        '';
        buildPhase = ''
          cmakeDir=$PWD/third_party/ycmd/cpp
          mkdir build
          pushd build

          echo "Running cmake with flags:"
          for flag in "''${cmakeFlagsArray[@]}"; do
            echo "    $flag"
          done

          cmake -G "Unix Makefiles" . $cmakeDir ''${cmakeFlagsArray[@]}
          make -j ''${NIX_BUILD_CORES} ycm_support_libs

          popd
          rm -rf build
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
        # XXX: I'm not sure If I really should be removing '-lutil' on OSX...
        patchPhase = ''
          substituteInPlace autoload/vimproc.vim --replace \
            "vimproc_mac.so" \
            "vimproc_unix.so" \
        '' + lib.optionalString (stdenv.isDarwin) ''
          ls -la
          substituteInPlace make_unix.mak \
            --replace "-lutil" ""
        '';
        buildPhase = ''
          make -f make_unix.mak
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
          pushd ruby/command-t
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
