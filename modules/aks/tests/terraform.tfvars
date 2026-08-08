name                   = "test-aks"
resource_group_name    = "test-rg"
location               = "centralindia"
dns_prefix             = "test-aks"
service_principal_name = "test-aks-sp"

# Replace with the subnet ID created by the subnet module.
subnet_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/test-rg/providers/Microsoft.Network/virtualNetworks/test-vnet/subnets/test-subnet"
