terraform {
  required_version = ">= 1.9.0"

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.9"
    }
  }

  backend "local" {
    path = "../../.state/opentofu/cache-stack.tfstate"
  }
}
