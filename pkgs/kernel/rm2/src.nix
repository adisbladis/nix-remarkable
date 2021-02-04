{ fetchurl }:

let
  rev = "d4e7e07a390f8b2544ca09d69142d18114149004";
in {
  version = "4.14.78";
  src = fetchurl {
    url = "https://github.com/reMarkable/linux/archive/${rev}.tar.gz";
    sha256 = "1k1xkgsw2j9cspg2lpwvvbhd9m8mdcn9akqrrzpnfabbm5nbycfr";
  };
}
