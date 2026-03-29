{ inputs, ... }:
{
  imports = [ inputs.treefmt-nix.flakeModule ];

  perSystem =
    { config, ... }:
    {
      treefmt = {
        projectRootFile = "flake.nix";

        settings.global.excludes = [
          ".direnv/**"
          ".terraform/**"
          ".state/**"
          ".envrc"
          ".envrc.local"
          "fly/fly.toml"
          "infra/opentofu/.terraform/**"
        ];

        programs = {
          actionlint.enable = true;
          deadnix.enable = true;
          mdformat.enable = true;
          nixfmt.enable = true;
          shellcheck.enable = true;
          shfmt.enable = true;
          statix.enable = true;
          taplo.enable = true;
          yamlfmt.enable = true;
        };
      };

      formatter = config.treefmt.build.wrapper;
    };
}
