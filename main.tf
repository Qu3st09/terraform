terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}


resource "aws_instance" "Control" {
  ami           = "ami-0a8b4cd432b1c3063"
  instance_type = "t2.micro"
  security_groups = [ "Ansibel-SG" ]
  key_name = "Ansible"
  user_data = file("tomcatinstall.sh")

  tags = {
    Name = "Control_node"
  }
}

resource "aws_instance" "Managed_node" {
  ami           = "ami-0a8b4cd432b1c3063"
  instance_type = "t2.micro"
  security_groups = [ "Ansibel-SG" ]
  key_name = "Ansible"
  user_data = file("managednode.sh")

  tags = {
    Name = "Managed_node"
  }

}


