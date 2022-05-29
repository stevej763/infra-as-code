variable "key-path" {
  type    = string
  default = "./aws-key-pair.pem"
}

variable "key-pair" {
    type = string
    default = "deployment"
}

variable "ec2-remote-user" {
  type    = string
  default = "ec2-user"
}

variable "ubuntu-remote-user" {
  type    = string
  default = "ubuntu"
}

