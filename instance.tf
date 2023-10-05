resource "aws_instance" "app-server1" {
  instance_type               = "t2.micro"
  ami                         = "ami-053b0d53c279acc90"
  vpc_security_group_ids      = [aws_security_group.http-sg.id]
  subnet_id                   = aws_subnet.public-sb1.id
  associate_public_ip_address = true

  user_data = <<EOF
#!/bin/bash
sudo apt update
sudo apt install apache2 -y
EOF

  tags = {
    Name = "app-server-1"
  }
 
}

output "ec2_global_ips" {
  value = aws_instance.app-server1.public_ip
}


