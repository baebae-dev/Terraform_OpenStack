module "network" {
  source               = "./modules/network/vpc"
  network_name         = "jason-tf-network"
  subnet_name          = "jason-tf-subnet"

  public_subnet_cidrs  = ["192.168.1.0/24"]
  private_subnet_cidrs = ["192.168.10.0/24"]

  enable_nat_instance  = false
}

module "external_router" {
  source              = "./modules/network/router/ext"
  router_name         = "jason-tf-router"
  external_network_id = "a48f21af-04fe-4559-8085-a2bb0ae485ca"

  network_ids         = module.network.public_network_ids
  public_subnet_ids   = module.network.public_subnet_ids

  depends_on          = [module.network]
}

module "internal_router" {
  source              = "./modules/network/router/in"
  router_name         = "jason-tf-router"

  network_ids_a       = module.network.public_network_ids
  subnet_ids_a        = module.network.public_subnet_ids

  network_ids_b       = module.network.private_network_ids
  subnet_ids_b        = module.network.private_subnet_ids

  depends_on          = [module.network]
}
