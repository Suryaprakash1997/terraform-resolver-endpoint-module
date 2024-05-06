variable "region" {
  description = "AWS region"
  type        = string
  default     = null
}

variable "security_group_name" {
  description = "Route 53 resolver endpoint security group name"
  type        = string
  default     = null
}

variable "vpc_id" {
  description = "VPC ID where the endpoint needs to be deployed"
  type        = string
  default     = null
}

variable "vpc_cidr" {
  description = "VPC CIDR range"
  type = string
  default     = null
}

variable "local_internet_cidr" {
  description = "CIDR block for local internet access"
  type        = string
  default     = "0.0.0.0/0"
}

variable "dns_port" {
  description = "Port for Route 53 inbound connection"
  default     = 53
}

variable "resolver_endpoint_name" {
  description = "Resolver endpoint name"
  type        = string
  default     = null
}

variable "direction" {
  description = "Specify inbound or outbound for type of resolver endpoint"
  type        = string
  default     = null
}

variable "protocol" {
  description = "DNS-related transmission protocols"
  type        = list(string)
  default     = ["Do53"]
}

variable "subnet_id_1" {
  description = "Subnet ID for AZ1"
  type        = string
  default     = null
}

variable "subnet_id_2" {
  description = "Subnet ID for AZ2"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to be applied to resources"
  type        = map(string)
  default     = {}
}
