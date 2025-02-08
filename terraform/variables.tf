variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
  default     = "roadmapsh-ansible-key"
}

variable "domain_name" {
  description = "Domain name for the website"
  type        = string
  default     = "iac.nikhilmishra.live"
}

variable "project_tags" {
  description = "Tags for the project resources"
  type        = map(string)
  default = {
    Project = "IaC-Demo"
    Environment = "Production"
  }
}
