{ self, inputs, ... }:

{
  flake.nixosConfigurations.wsl = inputs.nixpks.lib.nixosSystem {
    modules = [
      self.nixosModules.wslConfiguration
    ];
  };
}
