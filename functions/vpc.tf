module "vpc" {
  source               = "../primitives/network/vpc"
  network_name         = "jason-tf-network"
  subnet_name          = "jason-tf-subnet"

  public_subnet_cidrs  = ["192.168.1.0/24"]
  private_subnet_cidrs = ["192.168.10.0/24"]
}

module "external_router" {
  source              = "../primitives/network/router/ext"
  router_name         = "jason-tf-router-ext"
  external_network_id = "a48f21af-04fe-4559-8085-a2bb0ae485ca"

  network_ids         = module.vpc.public_network_ids
  public_subnet_ids   = module.vpc.public_subnet_ids

  depends_on          = [module.vpc]
}

module "internal_router" {
  source              = "../primitives/network/router/in"
  router_name         = "jason-tf-router-in"

  network_ids_a       = module.vpc.public_network_ids
  subnet_ids_a        = module.vpc.public_subnet_ids

  network_ids_b       = module.vpc.private_network_ids
  subnet_ids_b        = module.vpc.private_subnet_ids

  depends_on          = [module.vpc]
}
