module "host1" {
  source = "./hosts/instancia1"

  cluster_name        = module.local.eks_name
  cluster_ssh_private = tls_private_key.cluster_ssh.private_key_pem
  cluster_ssh_public  = tls_private_key.cluster_ssh.public_key_openssh

  ami_id            = ""
  instance_type     = ""
  key_name          = ""
  private_subnet_ids = [
    module.networking.private_subnet_ids[0],
  ]
  public_subnet_id = module.networking.public_subnet_ids[0]

  depends_on = [module.networking]

}

module "host2" {
  source = "./hosts/instancia1"

  cluster_name        = module.local.eks_name
  cluster_ssh_private = tls_private_key.cluster_ssh.private_key_pem
  cluster_ssh_public  = tls_private_key.cluster_ssh.public_key_openssh

  ami_id            = ""
  instance_type     = ""
  key_name          = ""
  private_subnet_ids = [
    module.networking.private_subnet_ids[1]
  ]
  public_subnet_id = module.networking.public_subnet_ids[1]
  availability_zone = module.local.zone1

  depends_on = [module.networking]
}


module "local" {
  source = "./local"
}

module "networking" {
  source = "./network"
}