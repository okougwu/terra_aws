# Variable for Create Instance Module
variable "public_key_path" {
  description = "Public key path"
  default = "~/.ssh/project_key.pub"
}

variable "VPC_ID" {
    type = string
    default = ""
}

variable "ENVIRONMENT" {
    type    = string
    default = ""
}

variable "AWS_REGION" {
default = "eu-west-2"
}

variable "AMIS" {
    type = map
    default = {
        us-east-1 = "ami-06908478b0577ac8a"
        us-east-2 = "ami-0f497f2bb1862a8e9"
        eu-west-2 = "ami-0175a41d602341364"
        eu-west-1 = "ami-0543a5665b0c1f6ad"
    }
}

variable "INSTANCE_TYPE" {
  default = "t2.micro"
}

variable "PUBLIC_SUBNETS" {
  type = list
}