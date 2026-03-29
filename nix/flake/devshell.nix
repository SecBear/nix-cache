_: {
  perSystem =
    { config, pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        packages = [
          config.treefmt.build.wrapper
          pkgs.curl
          pkgs.flyctl
          pkgs.git
          pkgs.jq
          pkgs.just
          pkgs.nil
          pkgs.opentofu
          pkgs.openssl
        ];

        shellHook = ''
          export PROJECT_ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
          echo "dev shell ready: $PROJECT_ROOT"
        '';
      };
    };
}
