#variables for the development's main.tf
variable "AWS_REGION" {
    type = string
    default = "eu-west-2"    
}

variable "ENVIRONMENT" {
    type = string
    default = "Development"
}
