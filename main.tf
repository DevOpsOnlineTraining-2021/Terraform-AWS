provider "aws" {
  region = "${var.region}"
}

resource "aws_security_group" "security_group_tomcat" {
  name = "security_group_${var.tomcat_master_name}"
  description = "Allows all traffic"

  # SSH
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  # HTTP
  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }


  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }
}

resource "aws_instance" "tomcat" {
  instance_type = "${var.tomcat_instance_type}"
  security_groups = ["${aws_security_group.security_group_tomcat.name}"]
  ami = "${lookup(var.amis, var.region)}"
  key_name = "${var.tomcat_key_name}"
  
  tags = {
    Name = "${var.tomcat_master_name}"
  }

  # Add tomcat server startup
  provisioner "file" {
    connection {
      user = "ec2-user"
      host = "${aws_instance.tomcat.public_ip}"
      timeout = "5m"
      private_key = "${file("templates/${var.tomcat_key_name}.pem")}"
    }
    source = "templates/tomcat_startup.sh"
    destination = "/home/ec2-user/tomcat_startup.sh"
  }
  
  # Add tomcat-users.xml
  provisioner "file" {
    connection {
      user = "ec2-user"
      host = "${aws_instance.tomcat.public_ip}"
      timeout = "5m"
      private_key = "${file("templates/${var.tomcat_key_name}.pem")}"
    }
    source = "templates/tomcat-users.xml"
    destination = "/home/ec2-user/tomcat-users.xml"
  }

  
  # Add context file
  provisioner "file" {
    connection {
      user = "ec2-user"
      host = "${aws_instance.tomcat.public_ip}"
      timeout = "5m"
      private_key = "${file("templates/${var.tomcat_key_name}.pem")}"
    }
    source = "templates/context.xml"
    destination = "/home/ec2-user/context.xml"
  }

  provisioner "remote-exec" {
    connection {
      user = "ec2-user"
      host = "${aws_instance.tomcat.public_ip}"
      timeout = "5m"
      private_key = "${file("templates/${var.tomcat_key_name}.pem")}"
    }
    inline = [
      "chmod +x /home/ec2-user/tomcat_startup.sh",
      "chmod 777 /home/ec2-user/tomcat-users.xml",
      "chmod 777 /home/ec2-user/context.xml",
      "/home/ec2-user/tomcat_startup.sh ${var.tomcat_user_name} ${var.tomcat_user_password}"
    ]
  }
}

output "jenkins_master_public_ip" {
  value = "${aws_instance.tomcat.public_ip}"
}

output "jenkins_master_private_ip" {
  value = "${aws_instance.tomcat.private_ip}"
}