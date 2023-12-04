variable "list" {
    type = list
        default = ["t2.medium", "t2.nano", "t2.micro"]
}

variable "sg_id" {
  type = string

}

variable "subnet_id" {        #variable "public_subnet_id" {
  type = string
}

locals {
  common_tags = {
    Name = "imran-Ec2-testing"
    Owner = "imran.shaikh@einfochips.com"
    DM = "Shriram Deshpande"
    Project = "Internal POC"
    Department = "PES" 
  }
}