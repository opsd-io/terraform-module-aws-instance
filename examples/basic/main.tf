data "aws_ami" "debian11" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["debian-12-amd64-*"]
  }
}

module "network" {
  source = "github.com/opsd-io/terraform-module-aws-network"

  vpc_name   = "test-vpc"
  cidr_block = "10.100.0.0/16"

  public_subnet_groups = {
    "public1" = {
      availability_zones = {
        "a" = { cidr_block = "10.100.1.0/24" }
        "b" = { cidr_block = "10.100.2.0/24" }
        "c" = { cidr_block = "10.100.3.0/24" }
      }
    }
  }
}

resource "aws_key_pair" "me" {
  public_key = file("~/.ssh/id_rsa.pub")
}

module "vm_bastion" {
  source = "github.com/opsd-io/terraform-module-aws-instance"

  name          = "bastion"
  ami_id        = data.aws_ami.debian11.id
  instance_type = "t2.micro"
  subnet_id     = module.network.public_subnet_groups["public1"]["a"].id
  key_name      = aws_key_pair.me.key_name
}

output "network" {
  value = module.network
}

output "vm_bastion" {
  value = module.vm_bastion
}
