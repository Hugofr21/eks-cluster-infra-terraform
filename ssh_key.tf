resource "tls_private_key" "cluster_ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}


resource "local_file" "cluster_private" {
  filename        = "${path.module}/cluster_id_rsa"
  content         = tls_private_key.cluster_ssh.private_key_pem
  file_permission = "0600"
}

resource "local_file" "cluster_public" {
  filename = "${path.module}/cluster_id_rsa.pub"
  content  = tls_private_key.cluster_ssh.public_key_openssh
}