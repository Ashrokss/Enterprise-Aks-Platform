project     = "platform"
environment = "dev"
location    = "centralindia"

# The subnet sits inside the vnet address space.
# AKS uses 172.16.0.0/16 for services so it does not overlap either of these.
vnet_address_space      = ["10.0.0.0/16"]
subnet_address_prefixes = ["10.0.1.0/24"]
