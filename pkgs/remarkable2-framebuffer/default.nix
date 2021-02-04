{ stdenv
, lib
, fetchFromGitHub
, qmake
}:

stdenv.mkDerivation {
  pname = "remarkable2-framebuffer";
  version = "unstable-2021-01-31";

  src = fetchFromGitHub {
    owner = "ddvk";
    repo = "remarkable2-framebuffer";
    rev = "d65a6e043d565ca660d2a08b45bf33ffe3ef8e99";
    sha256 = "17z5g8v6qjzmxij51m9kqzwvwxpkr9j48z3nqxl7y9dmx88317r8";
  };

  nativeBuildInputs = [
    qmake
  ];

}
