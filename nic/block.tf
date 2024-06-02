data "azurerm_subnet" "snetblock" {
    for_each = var.nic
  name                 = each.value.name-snetblock
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
