resource "aws_instance" "app-server1" {
  instance_type               = "t2.micro"
  ami                         = "ami-053b0d53c279acc90"
  vpc_security_group_ids      = [aws_security_group.http-sg.id]
  key_name		= "ssh-key"
  associate_public_ip_address = true

  tags = {
    Name = "app-server-1"
  }
  provisioner "local-exec" {
   command = "echo ${self.public_ip} > /home/runner/work/github-action/github-action/inventory"
  }
 
}

output "ec2_global_ips" {
  value = aws_instance.app-server1.public_ip
}


