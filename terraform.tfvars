# instance
instance_app_name      = "tf-instance-app"
instance_app_count     = 1
instance_bastion_name  = "tf-instance-pub"
instance_bastion_count = 1
instance_db_name       = "tf-instance-db"
instance_db_count      = 1
image_name             = "Ubuntu18.04.6-Cloud"
flavor_name            = "a1.2c2m"

# keypair
keypair_name        = "tf-keypair"
create_keypair      = true

# security-group
security_group_name = "tf-secgroup"

# network
network_name           = "tf-network"
subnet_name            = "tf-subnet"
router_name            = "tf-router"
public_subnet_cidrs    = ["192.168.1.0/24"]
private_subnet_cidrs   = ["192.168.10.0/24", "192.168.11.0/24"]

# extra
prefix = "bell-" # 본인 이름으로 변경하고 사용

# volume
volume_count        = 1
volume_name         = "tf-volume"
volume_size         = "500"

# object_storage
object_storage_name = "tf-backend-container"

# backend
remote_state_name = "remote-state"
backend_address = "https://gov-cbt-objectstorage.kakaoicloud.in/v1/8323ba34b836415a98bc45c8b715dcfc/remote-state/terraform.tfstate"