resource "aws_security_group" "public_sg" {
  name        = "${module.local.env}-public-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "${module.local.env}-public-sg"
  }


  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" # semantically equivalent to all ports
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}


resource "aws_security_group" "private_sg" {
  name        = "${module.local.env}-private-sg"
  description = "Internal firewall - internal and outbound communication via NAT."
  vpc_id      = aws_vpc.main.id


  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${module.local.env}-private-sg"
  }
}


// Network Access Control List public
resource "aws_network_acl" "public_nacl" {
  vpc_id = aws_vpc.main.id

  egress {
    protocol   = "-1"
    rule_no    = 100 # port TCP 80
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "-1"
    rule_no    = 100 # port TCP 80
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "${module.local.env}-public-nacl"
  }
}


# Network Access Control List privada
resource "aws_network_acl" "private_nacl" {
  vpc_id = aws_vpc.main.id

  egress {
    protocol   = "-1"
    rule_no    = 100 # port TCP 80
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "-1"
    rule_no    = 100 # port TCP 80
    action     = "allow"
    cidr_block = "10.0.0.0/16"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "${module.local.env}-private-nacl"
  }
}
