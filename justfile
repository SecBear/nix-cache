set shell := ["zsh", "-eu", "-o", "pipefail", "-c"]

default:
  @just --list

fmt:
  nix run .#fmt

lint:
  nix run .#lint

init-config:
  nix run .#init-config

plan:
  nix run .#plan

render:
  nix run .#render-fly-config

deploy:
  nix run .#deploy

gc:
  nix run .#gc

up:
  nix run .#up

status:
  nix run .#status

down:
  nix run .#down
