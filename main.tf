module "centosMON_MGR" {
  source = "./modules/centosMON_MGR"

  subnetwork_public   = module.networking
  subnetwork_private = module.networking

  depends_on = [module.networking]
}



module "networking" {
  source = "./network"
}