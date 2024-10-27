variable "REGION" {
  type        = string
  default     = "ap-south-1"
  description = "aws region"
}

variable "clusterName" {
  type        = string
  default     = "my-eks"
  description = "Name of the eks cluster"
}