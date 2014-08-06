{ stdenv, lib, fetchhg
, pkgconfig, gettext, glib
, libX11, libXext, libSM, libXpm, libXt, libXaw, libXau, libXmu, libICE
, gtk, ncurses
, python, ruby, luajit, perl, tcl
, cscope
}:

stdenv.mkDerivation rec {
  name = "vim-${version}";

  version = "7.4.316";

  dontStrip = 1;

  src = fetchhg {
    url = "https://vim.googlecode.com/hg/";
    rev = "v7-4-316";
    sha256 = "0scxx33p1ky0wihk04xqpd6rygp1crm0hx446zbjwbsjj6xxn7sx";
  };

  buildInputs = [
    pkgconfig gettext glib
    libX11 libXext libSM libXpm libXt libXaw libXau libXmu libICE
    gtk ncurses
    cscope
    python ruby luajit perl tcl
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
      "--with-python-config-dir=${python}/lib"
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
