{ stdenvNoCC, lib, fetchFromGitHub }:
stdenvNoCC.mkDerivation {
  pname = "vd55g-firmware";
  version = "git";

  src = fetchFromGitHub {
    owner = "petm5";
    repo = "vd55g-firmware";
    rev = "e519457ec5e379a791a6a28e8dbda03499c75bb7";
    sha256 = "0s74g3vxm2yqdcgb0sv8yvl0160njxpp83vhpki1awxwvj5bi2yg";
  };

  installTargets = [ "install" ];
  makeFlags = [ "DESTDIR=$(out)" ];

  meta = {
    description = "Binary firmware for VD55G family camera sensors";
    license = lib.licenses.gpl2;
    platforms = lib.platforms.unix;
    sourceProvenance = with lib.sourceTypes; [ binaryFirmware ];
  };
}
