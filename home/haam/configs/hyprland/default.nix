{ inputs, config, lib, pkgs, ... }:

{
  imports = [ inputs.hyprland.nixosModules.default ];

  wayland.windowManager.hyprland = {
    enable = true;
  };
}
