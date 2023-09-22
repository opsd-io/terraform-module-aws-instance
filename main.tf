terraform {
  required_version = ">= 1.3.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

data "aws_ec2_instance_type" "main" {
  instance_type = var.instance_type
}

resource "aws_instance" "main" {
  ami           = var.ami_id
  instance_type = var.instance_type
  ebs_optimized = var.ebs_optimized

  user_data                   = var.user_data
  user_data_base64            = var.user_data_base64
  user_data_replace_on_change = true # !!!!

  associate_public_ip_address = var.associate_public_ip_address
  iam_instance_profile        = var.iam_instance_profile
  key_name                    = var.key_name
  monitoring                  = var.monitoring
  source_dest_check           = var.source_dest_check
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = length(var.security_group_ids) > 0 ? var.security_group_ids : null

  # launch_template {}

  private_dns_name_options {
    hostname_type                        = var.hostname_type
    enable_resource_name_dns_a_record    = var.enable_resource_name_dns_a_record
    enable_resource_name_dns_aaaa_record = var.enable_resource_name_dns_aaaa_record
  }

  root_block_device {
    delete_on_termination = true
    encrypted             = var.root_volume_encryption
    volume_type           = var.root_volume_type
    volume_size           = var.root_volume_size
    iops                  = var.root_iops
    tags = merge(var.common_tags, {
      Name = "${var.name}-root"
    })
  }

  # ebs_block_device {}

  # ephemeral_block_device {}

  tags = merge(var.common_tags, {
    Name = var.name
  })

}
