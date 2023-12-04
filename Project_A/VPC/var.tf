variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "my_subnet" {
  type = list(object({
    name              = string,
    cidr_block        = string,
    availability_zone = string

  }))
}
