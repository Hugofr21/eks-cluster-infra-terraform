variable "ami_id" {
  description = "AMI ID for the instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnets where the instance will have ENIs"
  type        = list(string)
}

variable "public_subnet_id" {
  description = "ID of the public subnet"
  type        = string
}

variable "key_name" {
  description = "Name of the key pair for SSH access"
  type        = string
}

variable "availability_zone" {
  description = "Optional AZ for the primary ENI"
  type        = string
  default     = null
}

variable "cluster_name" {
  description = "Cluster name for tagging"
  type        = string
}

variable "cluster_ssh_private" {
  description = "RSA private key used for intra-cluster communication"
  type        = string
}

variable "cluster_ssh_public" {
  description = "OpenSSH public key for authorized_keys"
  type        = string
}

variable "ssh_user" {
  description = "SSH username on the instance"
  type        = string
  default     = "ubuntu"
}

variable "security_groups" {
  description = "List of applicable security groups"
  type        = list(string)
  default     = []
}
