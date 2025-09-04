variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "name_prefix" {
  description = "Name/Tag prefix for resources"
  type        = string
  default     = "balerica"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "EC2 instance type"
}

variable "key_name" {
  type        = string
  description = "Existing EC2 Key Pair name"
}

variable "ssh_cidr" {
  type        = string
  default     = "0.0.0.0/0"
  description = "CIDR allowed to SSH"
}

variable "http_cidr" {
  type        = string
  default     = "0.0.0.0/0"
  description = "CIDR allowed to HTTP 80"
}

variable "customer_gateway_ip" {
  description = "Public static IP of on-prem VPN device (not behind NAT)"
  type        = string
}

variable "customer_bgp_asn" {
  description = "Customer gateway BGP ASN"
  type        = number
  default     = 65000
}

variable "amazon_side_asn" {
  description = "Amazon side ASN for VGW"
  type        = number
  default     = 64512
}

variable "use_static_routes" {
  description = "true to use static routes, false for BGP"
  type        = bool
  default     = false
}

variable "onprem_route_cidr" {
  description = "On-prem CIDR to route over VPN when using static routes"
  type        = string
  default     = "192.168.0.0/16"
}
