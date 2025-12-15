# Security Group / Firewall for EC2 Instance
resource "aws_security_group" "ec2_sg" {
  name        = "EC2_SG"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = "EC2_SG"
  }
}

# Ingress rules for the Security Group
resource "aws_vpc_security_group_ingress_rule" "inbound_rules" {
  security_group_id = aws_security_group.ec2_sg.id
  cidr_ipv4         = aws_vpc.vpc.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

# Egress rules for the Security Group
resource "aws_vpc_security_group_egress_rule" "outbound_rules" {
  security_group_id = aws_security_group.ec2_sg.id
  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}
