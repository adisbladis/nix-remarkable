{ fetchurl }:

let
  rev = "1774e2a6a091fdc081324e966d3db0aa9df75c0b";
in {
  version = "4.9.84-zero-gravitas";
  src = fetchurl {
    url = "https://github.com/reMarkable/linux/archive/${rev}.tar.gz";
    sha256 = "103qsl5dma6i680bf5bsc6n4fk684k03df4nlzjjmmwx8pz7qnqb";
  };
}
