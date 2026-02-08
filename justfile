# List all the recipes
default:
  @just --list

# Update secrets, stage .nix files
rebuild-pre:
  nix flake update my-secrets
  git add *.nix

# Build configuration
rebuild:
  @just rebuild-pre
  nh os build

# Build configuration and switch
switch:
  @just rebuild-pre
  nh os switch

# Build configuration and test
test:
  @just rebuild-pre
  nh os test

# Fetch update from origin and merge
update:
  git fetch origin main
  git merge update_lock_action
  git branch -d update_lock_action
  git branch -rd update_lock_action

# Reload developer environment and update secrets
dev:
  @just rebuild-pre
  direnv reload

default_hostname := "xenon"

repl host=default_hostname:
  nixos-rebuild repl --flake .#{{host}}

inspect:
  nix-inspect --expr 'builtins.getFlake "/home/mocha/nix-config"'

build-vm host=default_hostname:
  rm -rf result
  rm {{host}}.qcow2
  nixos-rebuild build-vm --flake .#{{host}}
  @just run-vm {{host}}

run-vm host=default_hostname:
  ./result/bin/run-{{host}}-vm
