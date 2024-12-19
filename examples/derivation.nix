{ pkgs, ... }:

pkgs.stdenv.mkDerivation {
  name = "simple-rust-app";
  src = ./main.rs;

  buildInputs = [ pkgs.rustc ];

  buildPhase = ''
    rustc $src -o simple-rust-app
  '';

  installPhase = ''
    mkdir -p $out/bin
    mv simple-rust-app $out/bin/
  '';

  meta = with pkgs.lib; {
    description = "A simple Rust program compiled with rustc";
    license = licenses.mit;
    maintainers = with maintainers; [ exampleMaintainer ];
  };
}
