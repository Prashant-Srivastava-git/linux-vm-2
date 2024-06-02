resource "azurerm_subnet" "bastion-snet1" {
    for_each = var.bastion
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes
}

resource "azurerm_public_ip" "pipbastion" {
    for_each = var.bastion
  name                = each.value.name-pip
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = each.value.allocation_method
  sku                 =each.value.sku
}

resource "azurerm_bastion_host" "host" {
    for_each = var.bastion
  name                = each.value.name-host
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = each.value.name-ip
    subnet_id            = azurerm_subnet.bastion-snet1[each.key].id
    public_ip_address_id = azurerm_public_ip.pipbastion[each.key].id
  }
}