set -e
$EDITOR ~/niri-dots/nix-config/configuration.nix
pushd ~/niri-dots/nix-config

if git diff --quiet '*.nix'; then
  echo "No changes detected, exiting."
  popd
  exit 0
fi

git diff -U0 '*.nix'

echo "Updating flake..."

nix flake update

echo "NixOS rebuilding..."

sudo nixos-rebuild switch --impure --flake .

current=$(nixos-rebuild list-generations | grep current)

git commit -am "$current"

popd

echo "Built succesfully!"

