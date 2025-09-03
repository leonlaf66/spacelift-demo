#------------------------------------------------------------------------------
# General Variables
#------------------------------------------------------------------------------

variable "app_name" {
  description = "The name of the application, used to name resources (e.g., 'my-app-demo')."
  type        = string
}

variable "common_tags" {
  description = "A map of common tags to apply to all resources."
  type        = map(string)
  default     = {}
}

variable "environment" {
  description = "the project environment"
  type        = string
  default     = "dev"
}

#------------------------------------------------------------------------------
# Security Group Variables
#------------------------------------------------------------------------------

variable "sec_group_desc" {
  description = "A description for the security group."
  type        = string
  default     = "Security group managed by Terraform"
}

variable "ingress_rule" {
  description = "A list of ingress rules to apply to the security group."
  type = list(object({
    description                  = string
    from_port                    = optional(number)
    to_port                      = optional(number)
    ip_protocol                  = string
    cidr_ipv4                    = optional(string)
    referenced_security_group_id = optional(string)
  }))
  default = []
}

variable "egress_rule" {
  description = "A list of egress rules to apply to the security group."
  type = list(object({
    description                  = string
    from_port                    = optional(number)
    to_port                      = optional(number)
    ip_protocol                  = string
    cidr_ipv4                    = optional(string)
    referenced_security_group_id = optional(string)
  }))
  default = [{
    description = "Allow all outbound traffic"
    ip_protocol = "-1"
    cidr_ipv4   = "0.0.0.0/0"
  }]
}

#------------------------------------------------------------------------------
# EC2 Instance Variables
#------------------------------------------------------------------------------

variable "instance_type" {
  description = "The instance type for the EC2 instance."
  type        = string
  default     = "t3.micro"
}
variable "key_name" {
  description = "Key name of the Key Pair to use for the instance"
  type        = string
  default     = "spacelift-demo"
}