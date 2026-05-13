variable "do_token" {
  description = "DigitalOcean API token"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "DigitalOcean region"
  type        = string
  default     = "sgp1"
}

variable "project_name" {
  description = "Project name prefix"
  type        = string
  default     = "ha-lb"
}

variable "droplet_size" {
  description = "Droplet size"
  type        = string
  default     = "s-1vcpu-1gb"
}

variable "image" {
  description = "OS image"
  type        = string
  default     = "ubuntu-22-04-x64"
}

variable "ssh_public_key_path" {
  description = "CM devops user's public SSH key path"
  type        = string
  default     = "/home/devops/.ssh/id_rsa.pub"
}

variable "existing_vpc_uuid" {
  description = "Existing DigitalOcean VPC UUID where CM is already connected"
  type        = string
}

variable "cm_private_ip" {
  description = "Control machine private IP inside the existing VPC"
  type        = string
}