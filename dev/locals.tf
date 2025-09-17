locals {
  common_tags = {
    Owner       = "LEON"
    Project     = "Spacelift Demo"
    ManagedBy   = "Terraform"
    Environment = "dev"
  }
  app_name = "spacelift-demo-test"
}