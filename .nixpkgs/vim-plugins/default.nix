{ stdenv, lib, pkgs, callPackage
, fetchzip, fetchgit
, cmake
, vim, ruby, python, perl, llvmPackages
, which
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
    # until Darwin gets support for 3.4
    clangDarwin = fetchzip {
      url = http://llvm.org/releases/3.4/clang+llvm-3.4-x86_64-apple-darwin10.9.tar.gz;
      sha256 = "08xbg3q1nkd06vdzb79vmsr3zlv0fhphd9qycyy32gvidzwcgzxq";
    };
    plugins = lib.mapAttrs mkVimPlugin sources // {
      youcompleteme = stdenv.mkDerivation {
        name = "youcompleteme";
        src = fetchgit {
          url = "https://github.com/Valloric/YouCompleteMe.git";
          rev = "ede37d02313d905c2415cb2f3e0fd71c91fa0741";
          sha256 = "047xzqvchr0y62qf5mfqv6ixffl6m0qzfhl91azpjb6ifz5gh4a3";
        };
        #buildInputs = [ python cmake ] ++ lib.optional stdenv.isLinux llvmPackages.clang;
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
            "-DUSE_CLANG_COMPLETER=ON"
            "-DPYTHON_LIBRARY=$pythonLib"
            "-DPYTHON_INCLUDE_DIR=$pythonInclude"
          )
        '' + (if stdenv.isDarwin then ''
          cmakeFlagsArray+=(
            "-DPATH_TO_LLVM_ROOT=${clangDarwin}"
            "-DEXTERNAL_LIBCLANG_PATH=${clangDarwin}/lib/libclang.dylib"
          )
        '' else ''
          cmakeFlagsArray+=(
            "-DUSE_SYSTEM_LIBCLANG=ON"
          )
        '');
        buildPhase = ''
          export CC=gcc
          export CXX=g++

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
          platforms   = with platforms; linux ++ darwin;
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
        patchPhase = ''
          substituteInPlace autoload/vimproc.vim --replace \
            "vimproc_mac.so" \
            "vimproc_unix.so" \
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
        buildInputs = [ perl ruby ];
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
