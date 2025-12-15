# Ubuntu 2 EC2 Instance
resource "aws_instance" "EC2_Instance" {
  ami           = "ami-0ecb62995f68bb549" # Ubuntu 2 AMI
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.public_subnet.id
  security_groups = [ aws_security_group.ec2_sg.name ]

  tags = {
    Name = "EC2 Instance"
  }
}
