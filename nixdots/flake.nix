{
    description = "my first reproducible home environment";

    #inputs list all the dependencies needed
    inputs = {
        #using the 25.11 stable channel instead of nixos-unstable 
        #unstable channel directly acesses the master branch of Nixpkgs which receives new commits before extensive testing
        nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    #outputs list all the outputs that flake.nix will produce
    outputs = { self, nixpkgs, home-manager, ... }@inputs:
        let
            system = "x86_64-linux";
            pkgs = nixpkgs.legacyPackages.${system};
        in {
            homeConfigurations."jawknee" = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;

                #this points the Nix (package manager) to the actual configuratiomn file
                modules = [ ./home.nix];
            };
        };
}
