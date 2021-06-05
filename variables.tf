
variable "region" {
  default  = "us-east-1"
  description = "AWS region"
}


variable "tomcat_master_name" {
  description = "V2 DevOps tomcat"
  default = "V2DevOps-tomcat"
}

variable "tomcat_instance_type" {
  default = "t2.micro"
}

variable "tomcat_key_name" {
  default = "devops"
  description = "SSH key located in tyour AWS account."
}

variable "amis" {
  description = "ami to spawn."
  default = { 
    us-east-1 = "ami-096fda3c22c1c990a"
  }
}
