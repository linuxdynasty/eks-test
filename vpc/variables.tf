variable "region" {
  description = "AWS Region to spin up this VPC at"
  type        = string
  default     = "us-west-2"
}

variable "vpn_cidr_block" {
  description = "CIDR block to be used by this VPC"
  type        = string
}

variable "private_subnet_cidrs" {
  description = "Private subnets' CIDR blocks"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "Public subnets' CIDR blocks"
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Whether or not to have a NAT gateway spun up in this VPC"
  type        = bool
}

variable "single_nat_gateway" {
  description = "Whether or not to have a single NAT gateway spanning acrooss all private subnets in this VPC"
  type        = bool
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the Default VPC"
  type        = bool
}

variable "profile" {
  description = "AWS profile to use"
  type        = string
}