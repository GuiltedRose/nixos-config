{ config, pkgs, ... }: {
  imports = builtins.map (file: ./. + "/${file}") (
    builtins.filter (file:
      builtins.match ".*\\.nix$" file != null && file != "default.nix"
    ) (builtins.attrNames (builtins.readDir ./.))
  );
}

