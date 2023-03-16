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

# volume
volume_count        = 1
volume_name         = "tf-volume"
volume_size         = "500"

# keypair
keypair_name        = "tf-keypair"

# object_storage
object_storage_name = "tf-backend-container"

# backend
backend_address = "https://gov-cbt-objectstorage.kakaoicloud.in/v1/8323ba34b836415a98bc45c8b715dcfc/tf-test-container/terraform.tfstate"

# security-group
sec_group_name_bastion = "sg-bastion"
sec_group_name_priv    = "sg-priv"
sec_group_name_pub     = "sg-pub"

# extra
prefix = "bell-" # 본인 이름으로 변경하고 사용
env    = "test"