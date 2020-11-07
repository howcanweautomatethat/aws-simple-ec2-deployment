terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-west-2" //aws region for deployment
}

resource "aws_instance" "Server" {
  count         = "${var.instance_count}" // Pulls from the vars.tf with the number of instances you want deploy
  ami           = "ami-02f147dfb8be58a10" //the latest Red Hat 8 AMI
  instance_type = "t2.micro" //instance type you are launching
  subnet_id     = "YourSubnetHere" //Subnet you want to launch the EC2 instance in
  key_name      = "YourKeyHere" //KeyPair you created in the AWS Console
  user_data = "${file("userdata.sh")}" //pulls from userdata.sh and is currently made for RHEL/Cent
  tags = {
  Name = "${var.instance_name}${count.index + 1}" //Will put a Name tag with the instance name and count
  MadeBy = "Just Automate it!" //Will put a tag called MadeBy
}
}
