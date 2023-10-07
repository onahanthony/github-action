resource "aws_security_group" "http-sg" {
  name        = "allow_http_access"
  description = "allow inbound http traffic"
  vpc_id      = "vpc-0fc04ba251345b5d1"

  ingress {
    description = "from my ip range"
    from_port   =  80
    to_port     =  80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "from my ip range"
    from_port   =  8080
    to_port     =  8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "from my ip range"
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    to_port     = "0"
  }
  tags = {
    "Name" = "Application-1-sg"
  }
}
