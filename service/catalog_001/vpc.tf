module "vpc" {
  source = "../../primitives/network/vpc"

  network_name         = "jason-tf-network"
  subnet_name          = "jason-tf-subnet"
  router_name          = "jason-tf-router"

  public_subnet_cidrs  = ["192.168.1.0/24"]
  private_subnet_cidrs = ["192.168.10.0/24", "192.168.11.0/24"]

  external_network_id  = "a48f21af-04fe-4559-8085-a2bb0ae485ca"
}
