variable "credentials_file" {
  type    = string
}

variable "env" {
  type    = string
}

variable "aws_profile" {
  type    = string
}

variable "region" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "devops_keypair" {
  type = string
}

variable "vpc_networks" {
  description = "map of VPC networks"
  type        = map(string)
  default     = {}
}

// variable "cidr" {
//   type = string
// }

// variable "cidr_zone" {
//   type = string
// }

// variable "docker_ami_id" {
//   type = string
// }

// variable "docker_instance_type" {
//   type = string
// }

variable "devops_allowed_networks" {
  type    = list(string)
}

variable "k8s_instance_type" {
  type    = list
}

variable "k8s_cluster_name" {
  type    = string
}

variable "k8s_node_pool_name" {
  type    = string
}

