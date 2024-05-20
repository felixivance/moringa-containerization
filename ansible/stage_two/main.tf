provider "aws" {
    region = var.aws_region
}


resource "aws_instance" "app_server" {
    ami = var.ami_id
    instance_type = var.instance_type

    tags = {
        Name = "AppServer"
    }

    provisioner "remote-exec" {
        inline= [
            "sudo apt-get update -y",
            "sudo apt-get install -y python3-pip",
            "sudo pip3 install ansible"
        ]

        connection {
            type        = "ssh"
            user        = "ubuntu"
            private_key = file(var.private_key_path)
            host        = self.public_ip
        }
    }
}

output "app_server_ip" {
    value = aws_instance.app_server.public_ip
}