#variable for Create Instance Module
variable "public_key_path" {
    description = "public_key_path"
    default = "~/.ssh/project_key.pub"
}

variable "VPC_ID" {
    type = string
    default = ""  
}

variable "ENVIRONMENT" {
    type = string
    default = ""  
}

variable "AWS_REGION" {
    default = "eu-west-2" 
}

variable "AMIS" {
    type = map 
    default = {
        eu-west-1    = "ami-01b1f2cdbfcb3644e"
        eu-west-2    = "ami-0175a41d602341364"
        eu-central-1 = "ami-0071fbe485985432e"
        eu-central-2 = "ami-0d997517a25a72c5e"
    } 
  
}


variable "INSTANCE_TYPE" {
    default = "t2.micro"      
}

variable "PUBLIC_SUBNETS" {
    type = list  
}
