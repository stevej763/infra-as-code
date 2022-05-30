variable "key-path" {
  type    = string
  default = "./terraform.pem"
}

variable "key-pair" {
  type    = string
  default = "terraform"
}

variable "ec2-remote-user" {
  type    = string
  default = "ec2-user"
}

variable "ubuntu-remote-user" {
  type    = string
  default = "ubuntu"
}

