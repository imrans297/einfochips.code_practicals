## VPC Creation ##

module "vpc" {
  source = "./VPC"
  #source = "./modules/vpc"

  my_subnet = [
    {
      name              = "PublicSubnet1"
      cidr_block        = "10.0.101.0/24"
      availability_zone = "ap-south-1a"
    },
    {
      name              = "PublicSubnet2"
      cidr_block        = "10.0.102.0/24"
      availability_zone = "ap-south-1b"
    },
  ]
}



## Security group creation ##

module "web_server_sg" {
  source     = "./Security_grp"
  vpc_id     = module.vpc.vpc_id
  depends_on = [module.vpc]

}

## Instance creation with nginx installed ##

module "ec2-module" {
  source           = "./EC2"
  sg_id            = module.web_server_sg.sg_id
  subnet_id        = module.vpc.public_subnet_id
  depends_on       = [module.vpc, module.web_server_sg]
}






