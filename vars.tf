variable "aws_region" {
  default     = "us-west-2"
}

variable "instance_count" {
  default = "1" //this will be the number of instances you Launch
}

variable "instance_name" {
  default = "WebApp" //This is the name of your instance, but won't change the hostname
}
