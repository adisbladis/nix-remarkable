{ stdenv, path, callPackage }:

with callPackage ./src.nix {};

# Annoyingly, makeLinuxHeaders (and the no-relocs patch) aren't
# exposed anywhere, so we have to re-import them.
let
  khpath = path + /pkgs/os-specific/linux/kernel-headers;
in
((callPackage khpath {}).makeLinuxHeaders {
  inherit version src;
}).overrideAttrs (oA: {
  buildPhase = ''
    make mrproper $makeFlags
    make headers_check $makeFlags
  '';
  checkPhase = "";
  installPhase = ''
    make INSTALL_HDR_PATH=$out headers_install
    mkdir -p $out/include/config
    # maybe wrong?
    echo "${oA.version}-default" > $out/include/config/kernel.release
  '';

  #patches = [ (khpath + /no-relocs.patch) ];
})
