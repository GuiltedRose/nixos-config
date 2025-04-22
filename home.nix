{ config, pkgs, ... }:

{
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;

  home.file.".config/pipewire/scripts/loopback-load.sh".text = ''
    #!/bin/sh
    pw-loopback -n "guitar-mix" --capture-props='{"node.name":"guitar-in","audio.channel":"right"}' &
    pw-loopback -n "mic-mix" --capture-props='{"node.name":"mic-in","audio.channel":"left"}' &
  '';

  systemd.user.services.pipewire-loopbacks = {
    Unit = {
      Description = "Custom PipeWire Loopbacks";
      After = [ "pipewire.service" ];
      Requires = [ "pipewire.service" ];
    };
    Service = {
      ExecStart = "%h/.config/pipewire/scripts/loopback-load.sh";
      Restart = "on-failure";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}

