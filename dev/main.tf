module "spacelift_demo" {
  source   = "../common_modules/ec2"
  app_name = local.app_name
  common_tags = local.common_tags

  ingress_rule = [
    {
      description = "Allow SSH from my IP"
      from_port   = 22
      to_port     = 23
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