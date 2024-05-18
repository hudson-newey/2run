# use packages from 2022-08-16 (rust version 1.62.1)
let
    rust-1_62_1="https://github.com/NixOS/nixpkgs/archive/7cf5ccf1cdb2ba5f08f0ac29fc3d04b0b59a07e4.tar.gz";
    rust-1_65_0="https://github.com/NixOS/nixpkgs/archive/79b3d4bcae8c7007c9fd51c279a8a67acfa73a2a.tar.gz";
in

let
    pkgs = import (builtins.fetchTarball {
        url = rust-1_62_1;
    }) {};

    # rustc = pkgs.rustc;
    # cargo = pkgs.cargo;
in

{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {


    # nativeBuildInputs is usually what you want -- tools you need to run
    nativeBuildInputs = with pkgs.buildPackages; [
        rustc
        cargo
    ];
}
