{ stdenv, linuxManualConfig, callPackage, lzop, kernelPatches, ... }:

with callPackage ./src.nix {};

(linuxManualConfig {
  inherit stdenv src version kernelPatches;
  configfile = "${src}/arch/arm/configs/zero-sugar_defconfig";
  allowImportFromDerivation = true;
}).overrideAttrs (oA: {
  nativeBuildInputs = (oA.nativeBuildInputs or []) ++ [ lzop ];
  NIX_CFLAGS_COMPILE_MARCH = " ";
  NIX_CFLAGS_COMPILE_MCPU = " ";
  NIX_CFLAGS_COMPILE_MFPU = " ";
  NIX_CFLAGS_COMPILE_MFLOAT_ABI = " ";
})
