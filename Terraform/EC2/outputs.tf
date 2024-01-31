output "ec2_id" {
  value = aws_instance.ec2-pub[*].id
}

output "Public-ip-instance" {
  value = aws_instance.ec2-pub[*].public_ip
}