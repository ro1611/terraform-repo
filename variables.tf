variable "access_key" {
    description = "AWS Access Key ID"
    type = "string"
}

variable "secret_key" {
    description = "AWS Secret Key ID"
    type = "string"
}

variable "region" {
    description = "Choose the region in which you want to deploy the resources"
    type = "string"
}

variable "cidr_block" {
    description = "Choose the CIDR block for your VPC"
    type = "string"
}

variable "ami" {
    description = "Choose AMI"
    type = "string"
}

variable "instance_type" {
    description = "Choose an instance type"
    type = "string"
    default = "t2.micro"
}

variable "instance_tenancy" {
    description = "Choose instance tenancy"
    type = "string"
    default = "default"
}
