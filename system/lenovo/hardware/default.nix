{ config, inputs, lib, pkgs, modulesPath, ... }: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-intel
    inputs.hardware.nixosModules.common-gpu-intel
    inputs.hardware.nixosModules.common-pc-laptop
    inputs.hardware.nixosModules.common-pc-ssd
  ];

  boot.initrd.availableKernelModules =
    [ "xhci_pci" "vmd" "ahci" "nvme" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/423fe7a2-56fc-4829-a5b0-107ba959dee3";
    fsType = "btrfs";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/8065-DE90";
    fsType = "vfat";
  };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/0bd4a8ee-278b-4115-be38-798273d3aeb3"; }];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp0s20f3.useDHCP = lib.mkDefault true;

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode =
    lib.mkDefault config.hardware.enableRedistributableFirmware;
  # Cooling management
  services.thermald.enable = lib.mkDefault true;
  # tlp defaults to "powersave", which doesn't exist on this laptop
  services.tlp.settings = { CPU_SCALING_GOVERNOR_ON_BAT = "schedutil"; };
}
