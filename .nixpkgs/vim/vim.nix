{ stdenv, lib, fetchhg, fetchFromGitHub
, pkgconfig, gettext, glib
, libX11, libXext, libSM, libXpm, libXt, libXaw, libXau, libXmu, libICE
, gtk2, ncurses
, python2Full, ruby, luajit, perl, tcl
, cscope
}:

stdenv.mkDerivation rec {
  name = "vim-${version}";

  version = "8.0.0005";

  dontStrip = 1;

  hardeningDisable = [ "fortify" ];

  src = fetchFromGitHub {
    owner = "vim";
    repo = "vim";
    rev = "v${version}";
    sha256 = "0ys3l3dr43vjad1f096ch1sl3x2ajsqkd03rdn6n812m7j4wipx0";
  };

  buildInputs = [
    pkgconfig gettext glib
    libX11 libXext libSM libXpm libXt libXaw libXau libXmu libICE
    gtk2 ncurses
    cscope
    python2Full ruby luajit perl tcl
  ];

  configureFlags = [
      "--enable-cscope"
      "--enable-fail-if-missing"
      "--with-features=huge"
      "--enable-gui=none"
      "--enable-multibyte"
      "--enable-nls"
      "--enable-luainterp=yes"
      "--enable-pythoninterp=yes"
      "--enable-perlinterp=yes"
      "--enable-rubyinterp=yes"
      "--enable-tclinterp=yes"
      "--with-luajit"
      "--with-lua-prefix=${luajit}"
      "--with-python-config-dir=${python2Full}/lib"
      "--with-ruby-command=${ruby}/bin/ruby"
      "--with-tclsh=${tcl}/bin/tclsh"
      "--with-tlib=ncurses"
      "--with-compiledby=Nix"
  ];

  meta = with stdenv.lib; {
    description = "The most popular clone of the VI editor";
    homepage    = http://www.vim.org;
    maintainers = with maintainers; [ cstrahan ];
    platforms   = platforms.unix;
  };
}
