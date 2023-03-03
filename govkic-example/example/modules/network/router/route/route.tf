resource "openstack_networking_router_route_v2" "route" {
  count             = min(length(var.destination_cidr), length(var.next_hop))
  region            = var.region_name

  router_id         = var.router_id
  destination_cidr  = var.destination_cidr[count.index]
  next_hop          = var.next_hop[count.index]
}