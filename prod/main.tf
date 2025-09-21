module "spacelift_demo" {
  source      = "../common_modules/ec2"
  app_name    = "spacelift-demo"
  environment = "prod"
  subnet_id   = "subnet-0ec5902204018ae8f"
  
  common_tags = {
    Owner       = "LEON"
    Project     = "Spacelift Demo"
    ManagedBy   = "Terraform"
    Environment = "prod"
  }

  ingress_rule = [
    {
      description = "Allow SSH from my IP"
      from_port   = 22
      to_port     = 22
      ip_protocol = "tcp"
      cidr_ipv4   = "100.0.19.192/32"
      referenced_security_group_id = null
    },
    {
      description = "Allow port 80 from my IP"
      from_port   = 80
      to_port     = 80
      ip_protocol = "tcp"
      cidr_ipv4   = "100.0.19.192/32"
      referenced_security_group_id = null
    }
  ]
}