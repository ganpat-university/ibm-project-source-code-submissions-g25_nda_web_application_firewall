resource "aws_instance" "AnilP-instance" {
  ami = var.AMI
  instance_type = "t2.micro"
  subnet_id =  "subnet-06507abf61a3f0603" #FFXsubnet2
  associate_public_ip_address = true
  key_name = "Anil-presidio-key"
  

  vpc_security_group_ids = [
    "${aws_security_group.ssh-allowed.id}"
  ]
  root_block_device {
    delete_on_termination = true
    volume_size = 10
    volume_type = "gp2"
  }
  tags = {
    Name ="AnilP-server-terraform"
    Environment = "DEV"
    OS = "UBUNTU"
    Managed = "IAC"
  }
  user_data = <<-EOT
    #!/bin/bash
    sudo su
    apt update
    sudo apt-get install -y python3-dev default-libmysqlclient-dev build-essential
    apt install -y python3 python3-pip git docker.io
    git clone https://github.com/anilprajapati22/waf-master.git
    pip3 install -r waf-master/requirements.txt
    python3 waf-master/manage.py runserver 0:80
  EOT

  depends_on = [ aws_security_group.ssh-allowed ]
}

