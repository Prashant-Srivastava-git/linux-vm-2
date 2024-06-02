data "azurerm_network_interface" "blocknic" {
    for_each = var.vm
  name                = each.value.name-blocknic
  resource_group_name = each.value.resource_group_name
}
