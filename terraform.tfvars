# instance
instance_count         = 1
instance_name          = "tf-instance-app"
bastion_instance_name  = "tf-bastion-instance"
nat_instance_name      = "tf-nat-instance"

# network
port_name              = "tf-port"
network_name           = "tf-network"
subnet_name            = "tf-subnet"
router_name            = "tf-router"
public_ip_network_name = "ext-private-net1"
public_subnet_cidrs    = ["192.168.2.0/24"]
private_subnet_cidrs   = ["192.168.12.0/24"]
routing_table_ext_next_hops = ["192.168.0.254"]
# 아래 두개는 같아야.
nat_instance_ip        = "192.168.0.59"
routing_table_in_next_hops = ["192.168.0.59"]

# volume
volume_count        = 1
volume_name         = "tf-volume"
volume_size         = "500"

# keypair
keypair_name        = "tf-keypair"

# object_storage
object_storage_name = "tf-backend-container"

# backend
remote_state_name = "remote-test" #"remote-state"
backend_address = "https://gov-cbt-objectstorage.kakaoicloud.in/v1/8323ba34b836415a98bc45c8b715dcfc/remote-state/terraform.tfstate"

# security-group
sec_group_name_bastion = "sg-bastion"
sec_group_name_priv    = "sg-priv"
sec_group_name_pub     = "sg-pub"

# extra
prefix = "bell-" # 본인 이름으로 변경하고 사용
env    = "test"