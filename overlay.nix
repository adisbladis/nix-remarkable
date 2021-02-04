self: super: {

  linux_remarkable = self.callPackage ./pkgs/kernel/rm1/kernel.nix {
    kernelPatches = [ ];
  };
  linux_remarkable2 = self.callPackage ./pkgs/kernel/rm2/kernel.nix {
    kernelPatches = [ ];
  };
  linuxPackages_remarkable = self.linuxPackagesFor self.linux_remarkable;
  linuxPackages = self.linuxPackages_remarkable;
  linux = self.linuxPackages.kernel;
  # linuxHeaders = self.callPackage ./pkgs/linux-remarkable/headers.nix { };

  libvncserver = (super.libvncserver.overrideAttrs (oA: {
    # Remove unnecessary dependencies
    buildInputs = [ ];
    cmakeFlags = [ "-DWITH_PNG=OFF" ];
  }));

  # TODO: Repackage
  # linuxPackages_remarkable = super.linuxPackages_remarkable.extend
  #   (selflp: superlp: {
  #     mxc_epdc_fb_damage = selflp.callPackage srcs.mxc_epdc_fb_damage.drv {};
  #   });

  appmarkable = self.callPackage ./pkgs/appmarkable { };
  chessmarkable = self.callPackage ./pkgs/chessmarkable { };
  evkill = self.callPackage ./pkgs/evkill { };
  # Need to figure out how to cross-compile Rust nightly
  plato = self.callPackage ./pkgs/plato {
    makeRustPlatform = super.pkgs.makeRustPlatform;
    callPackage = super.pkgs.callPackage;
    fetchFromGitHub = super.pkgs.fetchFromGitHub;
  };

  # TODO: Repackage
  # rM-vnc-server = self.callPackage srcs.rM-vnc-server.drv {};

  remarkable-fractals = self.callPackage ./pkgs/remarkable-fractals { };
  remarkable_news = self.callPackage ./pkgs/remarkable_news { };
  retris = self.callPackage ./pkgs/retris { };
  rm-video-player = self.callPackage ./pkgs/rm-video-player { };

}
