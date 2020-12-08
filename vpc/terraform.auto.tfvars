enable_nat_gateway   = true
single_nat_gateway   = true
enable_dns_hostnames = true
vpn_cidr_block       = "10.250.0.0/16"
profile              = "homeadvisor"
private_subnet_cidrs = [
  "10.250.0.0/24",
  "10.250.4.0/24",
  "10.250.8.0/24"
]
public_subnet_cidrs = [
  "10.250.12.0/24",
  "10.250.16.0/24",
  "10.250.20.0/24"
]