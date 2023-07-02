variable "aws_access_key" {
  description = "AWS access key"
}

variable "aws_secret_key" {
  description = "AWS secret key"
}

variable "myip" {
  description = "My IP"
}

variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "ec2_nexus" {
  type = object({
    user          = string
    instance_type = string
    ami           = string
    user_data     = string
  })
}

variable "ec2_client" {
  type = object({
    user          = string    
    instance_type = string
    ami           = string
    user_data     = string
  })
}
