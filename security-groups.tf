# Add http sg
resource "aws_security_group" "webserver" {
  name        = "webserver sg"
  description = "Web Security Group to allow inboud port 80 for webservers"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Webserver SG"
  }
}

# Add ssh sg
resource "aws_security_group" "ssh" {
  name        = "ssh sg"
  description = "Security Group to allow inboud port 22 for terraform"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "SSH SH"
  }
}

# Add outboud sg
resource "aws_security_group" "outbound" {
  name        = "outbound sg"
  description = "Security Group to allow oubound internet access from instance"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Outbound SG"
  }
}
