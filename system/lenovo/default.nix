{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware ../shared ];
  networking.hostName = "Lenovo";
  users = {
    extraUsers.haam = {
      extraGroups =
        [ "wheel" "audio" "video" "libvirtd" "networkmanager" "docker" ];
      description = "Hamza Zarrouk";
      useDefaultShell = true;
      isNormalUser = true;
      createHome = true;
    };
    defaultUserShell = pkgs.fish;
  };
  environment.systemPackages = [ pkgs.git pkgs.home-manager ];
}
