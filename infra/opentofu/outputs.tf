output "public_endpoints" {
  description = "Public endpoints for the cache stack."
  value = {
    cache_public_url = local.cache_public_url
    write_api_url    = local.fly_public_url
  }
}

output "fly_env" {
  description = "Non-secret environment variables rendered into fly.toml."
  value = {
    NIKS3_CACHE_URL         = local.cache_public_url
    NIKS3_ENABLE_READ_PROXY = tostring(var.niks3_enable_read_proxy)
    NIKS3_HTTP_ADDR         = ":5751"
    NIKS3_S3_BUCKET         = cloudflare_r2_bucket.cache.name
    NIKS3_S3_CONCURRENCY    = tostring(var.niks3_s3_concurrency)
    NIKS3_S3_ENDPOINT       = local.r2_s3_endpoint_host
    NIKS3_S3_REGION         = var.r2_s3_region
    NIKS3_S3_USE_SSL        = "true"
    NIKS3_SIGN_KEY_PATHS    = "/run/secrets/niks3-signing-key"
  }
}
