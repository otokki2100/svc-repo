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

variable "wiki_code_path_remote_1" {
  description = "Wiki Code Path Remote 1"
}

variable "wiki_code_path_remote_2" {
  description = "Wiki Code Path Remote 2"
}

variable "ec2_gitlab" {
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
  domain = "gitlab-${local.current_date}.${var.domain}"
}
