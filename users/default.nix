{ config, pkgs, ... }:

{
  imports = builtins.map (file: ./. + "/${file}") (
    builtins.filter (file: builtins.match ".*\\.nix$" file != null)
      (builtins.attrNames (builtins.readDir ./.))
  );
}

