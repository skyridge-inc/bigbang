{
  description = "A simple flake to include the hello program";

  outputs = { self, nixpkgs }: {
    packages.default = nixpkgs.legacyPackages.${builtins.currentSystem}.hello;
  };
}
