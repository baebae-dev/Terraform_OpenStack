resource "openstack_networking_router_route_v2" "router_route" {
  count             = length(var.destination_cidr)
  region            = var.region_name
  router_id         = openstack_networking_router_v2.router.id
  destination_cidr  = var.destination_cidr[count.index]
  next_hop          = var.next_hop[count.index]
}