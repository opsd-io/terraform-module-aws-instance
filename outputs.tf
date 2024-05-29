# output "instance" {
#   value = aws_instance.main
# }

output "id" {
  description = "The ID of the instance."
  value       = aws_instance.main.id
}

output "arn" {
  description = "The ARN of the instance."
  value       = aws_instance.main.arn
}

output "private_ip" {
  description = "The private IP of the instance."
  value       = aws_instance.main.private_ip
}

output "public_ip" {
  description = "The public IP of the instance."
  value       = aws_instance.main.public_ip
}

output "root_volume_id" {
  description = "The ID of the root volume."
  value       = one(aws_instance.main.root_block_device[*].volume_id)
}
