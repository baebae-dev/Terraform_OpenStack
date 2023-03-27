#output "instance" {
#  value = openstack_compute_instance_v2.instance
#}

output "instance_id" {
  value =openstack_compute_instance_v2.instance[*].id
  description = "ID of instance"
}

output "fixed_ip" {
  value = openstack_networking_port_v2.port.fixed_ip
}

