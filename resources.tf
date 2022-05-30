
resource "aws_instance" "apache" {
  ami           = "ami-0022f774911c1d690"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    aws_security_group.webserver.id,
    aws_security_group.ssh.id,
    aws_security_group.outbound.id
  ]
  key_name = var.key-pair
  tags = {
    Name = "apache-webserver-al2"
  }

  provisioner "remote-exec" {
    inline = ["echo 'Waiting for instance to start up'"]
    connection {
      type        = "ssh"
      user        = var.ec2-remote-user
      private_key = file(var.key-path)
      host        = aws_instance.apache.public_ip
    }
  }

  provisioner "local-exec" {
    command = "ansible-playbook -u ${var.ec2-remote-user} -i ${aws_instance.apache.public_ip}, --private-key ${var.key-path} ansible/apache.yml"
  }
}

resource "aws_instance" "nginx" {
  ami           = "ami-09d56f8956ab235b3"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    aws_security_group.webserver.id,
    aws_security_group.ssh.id,
    aws_security_group.outbound.id
  ]
  key_name = var.key-pair
  tags = {
    Name = "nginx-webserver"
  }

  provisioner "remote-exec" {
    inline = ["echo 'Waiting for instance to start up'"]
    connection {
      type        = "ssh"
      user        = var.ubuntu-remote-user
      private_key = file(var.key-path)
      host        = aws_instance.nginx.public_ip
    }
  }

  provisioner "local-exec" {
    command = "ansible-playbook -u ${var.ubuntu-remote-user} -i ${aws_instance.nginx.public_ip}, --private-key ${var.key-path} ansible/nginx.yml"
  }
}

output "apache-ip" {
  value = aws_instance.apache.public_ip
}

output "nginx-ip" {
  value = aws_instance.nginx.public_ip
}
