variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "myip" {
  description = "My IP"
}

variable "wiki_code_path_local" {
  description = "Wiki Code Path Local"
}

variable "wiki_code_path_remote" {
  description = "Wiki Code Path Remote"
}

variable "ec2_nexus" {
  type = object({
    instance_type = string
    ami           = string
    user          = string
    dist          = string
    domain        = string
  })
}

variable "ec2_client" {
  type = object({
    instance_type = string
    ami           = string
    user          = string    
    dist          = string
    domain        = string
  })
}

variable "domain" {
  description = "Domain"
}

locals {
  current_date = formatdate("YYMMDDHHmm", timestamp())
  domain = "nexus-${local.current_date}.${var.domain}"
}
