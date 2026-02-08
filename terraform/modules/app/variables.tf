variable "environment" {
  description = "Environment name (dev or prod)"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "min_size" {
  description = "ASG minimum size"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "ASG maximum size"
  type        = number
  default     = 2
}

variable "desired_capacity" {
  description = "ASG desired capacity"
  type        = number
  default     = 1
}

variable "vpc_id" {
  description = "VPC ID for the ALB and ASG"
  type        = string
  default     = ""
}

variable "subnet_ids" {
  description = "Subnet IDs for the ALB and ASG"
  type        = list(string)
  default     = []
}

variable "artifacts_bucket_name" {
  description = "S3 bucket name for deployment artifacts"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}
