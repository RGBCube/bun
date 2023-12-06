{
  lib,
  llvmPackages_16,

  cmake,

  libb64,
  boringssl,
  # libcares,
  libarchive,
  # lolhtml,
  mimalloc,
  tinycc,
  zlib,
  zstd,
  # lshpack,
}:

llvmPackages_16.stdenv.mkDerivation {
  pname = "bun";
  version = builtins.elemAt 0
    (builtins.match ''Bun_VERSION \\"(.*)\\"''
      (builtins.readFile ./CMakeLists.txt));

  nativeBuildInputs = [
    cmake

    libb64
    boringssl
    # libcares
    libarchive
    # lolhtml
    mimalloc
    tinycc
    zlib
    zstd
    # lshpack
  ];
}
