output "instance_id" {
  value = aws_instance.my-ec2.id
}

output "ami_id" {
  value = aws_ami_from_instance.demo.id
}

output "aws_instance" {
  value = aws_instance.my-ec2.public_ip
  
}