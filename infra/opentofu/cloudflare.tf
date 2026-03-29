resource "cloudflare_r2_bucket" "cache" {
  account_id    = var.cloudflare_account_id
  name          = local.bucket_name
  jurisdiction  = var.r2_jurisdiction
  location      = var.r2_location
  storage_class = var.r2_storage_class
}

resource "cloudflare_r2_custom_domain" "cache" {
  account_id   = var.cloudflare_account_id
  bucket_name  = cloudflare_r2_bucket.cache.name
  domain       = local.cache_hostname
  enabled      = true
  jurisdiction = var.r2_jurisdiction
  min_tls      = "1.2"
  zone_id      = var.cloudflare_zone_id
}
