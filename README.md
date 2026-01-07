# LISE++-nix!
Declarative (re)packaging for the nuclear physics software [LISE++](https://lise.frib.msu.edu/lise.html).
Since it's packaged with nix, it will just work!
<!---->
## Usage
### Standalone
```
git clone https://github.com/ewtodd/LISEplusplus-nix.git
cd LISEplusplus-nix
nix build
./result/bin/lise++
```
<!---->
### NixOS Configuration
<!---->
```
# in your flake.nix
inputs = {
  # your other inputs
  lisepp.url = "github:ewtodd/LISEplusplus-nix";
};
# ...
<!---->
# in your configuration.nix
{ inputs, ... }:
let
  lisepp = inputs.lisepp.packages."x86_64-linux".default;
in {
  # ...
  environment.systemPackages = [ lisepp ];
  # ...
}
```
