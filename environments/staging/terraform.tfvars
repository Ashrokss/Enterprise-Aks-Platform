project     = "platform"
environment = "staging"
location    = "centralindia"

# Deliberately a different range to dev so the two vnets could be peered
# later without renumbering. AKS services stay on 172.16.0.0/16.
vnet_address_space      = ["10.1.0.0/16"]
subnet_address_prefixes = ["10.1.1.0/24"]
