#variables for the development's main.tf
variable "AWS_REGION" {
    type = string
    default = "eu-west-1"    
}

variable "ENVIRONMENT" {
    type = string
    default = "production"
}
