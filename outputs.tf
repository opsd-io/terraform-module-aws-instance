# output "instance" {
#   value = aws_instance.main
# }

output "id" {
  value = aws_instance.main.id
}

output "arn" {
  value = aws_instance.main.arn
}

output "private_ip" {
  value = aws_instance.main.private_ip
}

output "public_ip" {
  value = aws_instance.main.public_ip
}

output "root_volume_id" {
  value = one(aws_instance.main.root_block_device[*].volume_id)
}
