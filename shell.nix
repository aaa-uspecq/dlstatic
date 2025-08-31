#{ pkgs ? import <nixpkgs> }:
#  pkgs.mkShell {
#    # nativeBuildInputs is usually what you want -- tools you need to run
#    nativeBuildInputs = [ pkgs.nodejs ];
#}
with import <nixpkgs> {};

stdenv.mkDerivation {
    name = "node";
    buildInputs = [
        sshpass
        lftp
        jq
        nodejs
        hugo
    ];
    shellHook = ''
        export PATH="$PWD/node_modules/.bin/:$PATH"
        alias scripts='jq ".scripts" package.json'
    '';
}
