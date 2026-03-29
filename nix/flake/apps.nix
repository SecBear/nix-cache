{ lib, ... }:
{
  perSystem =
    { config, ... }:
    let
      descriptions = {
        deploy = "Deploy the Fly app after syncing runtime secrets";
        down = "Destroy the Fly app and the OpenTofu-managed infrastructure";
        fmt = "Format the repository and OpenTofu configuration";
        gc = "Run niks3 garbage collection against the Fly write plane";
        init-config = "Create a local ignored tfvars file from the tracked example";
        lint = "Run formatting checks and validate the OpenTofu configuration";
        plan = "Run an OpenTofu plan for the cache stack";
        render-fly-config = "Render fly/fly.toml from OpenTofu outputs";
        status = "Show public endpoints and Fly app status";
        up = "Apply infrastructure and deploy the Fly app";
      };

      mkApp = packageName: {
        type = "app";
        program = "${config.packages.${packageName}}/bin/${packageName}";
        meta.description = descriptions.${packageName};
      };
    in
    {
      apps = lib.genAttrs [
        "deploy"
        "down"
        "fmt"
        "gc"
        "init-config"
        "lint"
        "plan"
        "render-fly-config"
        "status"
        "up"
      ] mkApp;
    };
}
