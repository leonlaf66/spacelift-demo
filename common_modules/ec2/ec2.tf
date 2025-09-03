data "aws_ami" "latest_ecs_optimized" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-ecs-hvm-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

data "aws_vpc" "selected" {
  filter {
    name   = "is-default"
    values = ["true"]
  }
}

data "aws_subnets" "all_in_vpc" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}

resource "random_shuffle" "subnet_shuffle" {
  input = data.aws_subnets.all_in_vpc.ids
}

resource "aws_instance" "example" {
  ami                    = data.aws_ami.latest_ecs_optimized.id
  instance_type          = var.instance_type 
  subnet_id              = random_shuffle.subnet_shuffle.result[0]
  vpc_security_group_ids = [aws_security_group.this.id]
  key_name               = var.key_name 

  tags = merge(
    var.common_tags,
    {
      Name = "${var.app_name}-ec2",
    }
  )
}