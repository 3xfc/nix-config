self: super: {
  linuxKernel = super.linuxKernel // {
    packagesFor = kernel: (super.linuxKernel.packagesFor kernel).extend (kself: ksuper: {
      ithc-linux = kself.callPackage ../pkgs/ithc-linux/latest.nix { };
      surface-gpe = kself.callPackage ../pkgs/surface-gpe { };
      surface-cameras = kself.callPackage ../pkgs/surface-ipu6-camera-modules { };
      surface-platform-profile = kself.callPackage ../pkgs/surface-platform-profile { };
    });
  };
  vd55g-firmware = super.callPackage ../pkgs/vd55g-firmware { };
}
