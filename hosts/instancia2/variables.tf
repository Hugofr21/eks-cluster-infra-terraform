variable "cluster_ssh_private" {
  description = "Chave privada RSA usada para comunicação entre hosts (PEM)"
  type        = string
}

variable "cluster_ssh_public" {
  description = "Chave pública OpenSSH usada para authorized_keys entre hosts"
  type        = string
}

variable "ssh_user" {
  description = "Utilizador SSH na instância (ex: ubuntu ou ec2-user)"
  type        = string
  default     = "ubuntu"
}
