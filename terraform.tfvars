awsregion            = "us-east-1"
vpc_cidr             = "10.40.0.0/16"
vpc_name             = "VK13ansiblevpc"
environment          = "production"
projid               = "PHOENIX-123"
public_subnet_cidrs  = ["10.40.1.0/24", "10.40.2.0/24", "10.40.3.0/24", "10.40.4.0/24", "10.40.5.0/24", "10.40.6.0/24"]
private_subnet_cidrs = ["10.40.10.0/24", "10.40.20.0/24", "10.40.30.0/24", "10.40.40.0/24"]
azs                  = ["us-east-1a", "us-east-1b", "us-east-1c"]
ami = {
  us-east-1 = "ami-0149b2da6ceec4bb0" # Canonical, Ubuntu, 20.04 LTS, amd64 focal image
  us-east-2 = "ami-0430580de6244e02e"
}
instance_type = {
  development = "t2.micro"
  production  = "t2.micro"
  testing     = "t2.micro"
}
key_name = "ansible"