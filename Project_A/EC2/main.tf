data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] #  099720109477

}



resource "aws_instance" "my-ec2" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.list[2]
  #availability_zone           = "ap-south-1"
  key_name                    = "new_key-aws"
  associate_public_ip_address = true
  subnet_id                   = var.subnet_id      #var.public_subnet_id
  vpc_security_group_ids      = [var.sg_id]         #[var.sg_id]

  tags = local.common_tags
  
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("../new_key-aws.pem")
    host        = self.public_ip
  }

  provisioner "file" {
    source = "./Ansible/playbook.yml"
    destination = "/home/ubuntu/playbook.yml"
    
  }

  provisioner "file" {
    source = "./Ansible/install_ansible.sh"
    destination = "/home/ubuntu/install_ansible.sh"
    
  }
   

  provisioner "remote-exec" {
    inline = [ 
      "chmod +x /home/ubuntu/install_ansible.sh",
      "/home/ubuntu/install_ansible.sh",
     ]  
  }

}
resource "aws_ami_from_instance" "demo" {
    name = "ubuntu-ami"
    source_instance_id = aws_instance.my-ec2.id
  
}
