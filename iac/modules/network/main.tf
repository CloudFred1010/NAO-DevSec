resource "azurerm_network_security_group" "secure_nsg" {
  name                = "juice-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "AllowHTTPS"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"         # HTTPS can stay open
    destination_address_prefix = "*"
  }

  # 🔒 Harden SSH access
  security_rule {
    name                       = "AllowSSH"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "185.241.227"   # ✅ Replace with your public IP
    destination_address_prefix = "*"
  }
}
