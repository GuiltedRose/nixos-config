{config, pkgs, ...}: 
{
 users.users.zelda={
     isNormalUser = true;
     extraGroups = [ "wheel" "audio" "rtkit" ];
     shell = pkgs.bash;
     group = "zelda";
     packages = with pkgs; [
        discord
        wget
        vim
        firefox
        chromium
        vscodium
        kdenlive
        krita
        obs-studio
        git
        python3
        cmake
        gcc
        ninja
        pokemmo-installer
        prismlauncher
        jdk23
	audacity
        zip
        unzip
        plasma5Packages.kdeconnect-kde
        qjackctl
        rtaudio
        wineasio
     ];
   };
}
