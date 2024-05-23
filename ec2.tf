resource "aws_instance" "demo-instace" {  
  ami                     = "ami-090252cbe067a9e58"
  instance_type           = "t2.micro"
  vpc_security_group_ids = ["sg-03ec942beb955be40"]
  tags = {
    Name = "demo-instance"
    created = "Raja"
  }

# provisioners will work only 1 time while creating them
# Provisioners won't work once the resource are created
#   provisioner "local-exec" {
#     command = "echo ${self.private_ip} > private_ips.txt"
#   }

#  provisioner "local-exec" {
#     command = "ansible-playbook -i private_ips.txt nginx.yaml"  
#  }


  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "sudo dnf install ansible -y",
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx"

    ]
  }
}
