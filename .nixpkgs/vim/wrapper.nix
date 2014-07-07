{ stdenv, lib, makeWrapper, vim, ruby, env ? { } }:

# This provides a wrapper around vim, allowing the user to pass extra
# environment variables.

let
  parsedDrv = (builtins.parseDrvName vim.name);
  shellEscape = x: "'${lib.replaceChars ["'"] [("'\\'" + "'")] x}'";
  hasEnv = env != null && env != { };
  envVars = lib.mapAttrs (n: v: toString v) env;
  wrapArgs = with lib;
    "${concatStringsSep " "
        ((mapAttrsToList (n: v: ''--set ${shellEscape n} ${shellEscape v}'') envVars))}";

in stdenv.mkDerivation rec {
  name = "${parsedDrv.name}-wrapped-${parsedDrv.version}";

  buildInputs = [ ruby makeWrapper ];

  buildCommand = ''
    cp -a ${vim} $out
    chmod -R u+w $out
  '' + lib.optionalString (hasEnv && name == "macvim") ''
    wrapProgram $out/bin/mvim ${wrapArgs}
    ruby ${./patch_plist.rb} \
      ${shellEscape (builtins.toXML envVars)} \
      $out/Applications/MacVim.app/Contents/Info.plist
  '' + lib.optionalString (hasEnv && name != "macvim") ''
    wrapProgram $out/bin/vim ${wrapArgs}
  '';

  inherit (vim) meta;
}
