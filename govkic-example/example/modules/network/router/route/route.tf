resource "openstack_networking_router_route_v2" "route" {
  count             = min(length(var.destination_cidrs), length(var.next_hops))
  region            = var.region_name

  router_id         = var.router_id
  destination_cidr  = var.destination_cidrs[count.index]
  next_hop          = var.next_hops[count.index]
}