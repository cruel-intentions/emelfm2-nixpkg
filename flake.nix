{
  description = "EmelFM2";
  inputs.nixpkgs.url   = "github:nixos/nixpkgs/22.05";
  inputs.emelfm2.url   = "github:tom2tom/emelfm2";
  inputs.emelfm2.flake = false;
  outputs = inputs: 
    let pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
    in
    {
      packages.x86_64-linux.default = pkgs.stdenv.mkDerivation {
        buildInputs  = with pkgs; [file gtk3 pkg-config zlib];
        installPhase = "make PREFIX=$out install";
        makeFlags    = "WITH_GTK3=1 PREFIX=$out";
        pname        = "emelfm2";
        src          = "${inputs.emelfm2}";
        version      = "0.9.1.2";
      };
    };
}
