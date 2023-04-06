{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware ../shared ];
  networking.hostName = "Lenovo";
  programs.fish.enable = true;
  users = {
    users.haam = {
      extraGroups =
        [ "wheel" "audio" "video" "libvirtd" "networkmanager" "docker" ];
      description = "Hamza Zarrouk";
      useDefaultShell = true;
      isNormalUser = true;
      initialPassword = "221";
      createHome = true;
    };
    defaultUserShell = pkgs.fish;
  };
  environment.systemPackages = [ pkgs.git pkgs.home-manager ];
}
