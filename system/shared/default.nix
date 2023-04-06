{ outputs, config, lib, pkgs, inputs, ... }: {
  imports = [ inputs.selena.nixosModules.selena ];
  selena.system.root.boot-loader.enable = true;
  selena.system.root.file-system.enable = true;
  selena.system.root.kernel.enable = true;
  selena.system.services.bluetooth.enable = true;
  selena.system.services.inputs.enable = true;
  selena.system.services.networking.enable = true;
  selena.system.services.package-mangement.enable = true;
  selena.system.services.sound.enable = true;
  selena.system.services.video.enable = true;
  selena.system.services.virtulations.enable = true;
  selena.system.services.printing.enable = true;
  selena.system.system-packages.fonts.enable = true;
}
