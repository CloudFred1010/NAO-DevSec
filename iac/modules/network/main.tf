# ---------------------------
# Network Security Group
# ---------------------------
resource "azurerm_network_security_group" "secure_nsg" {
  name                = "juice-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  # ✅ Allow inbound HTTPS traffic from Internet
  security_rule {
    name                       = "AllowHTTPS"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"   # Open Internet
    destination_address_prefix = "*"
  }

  # 🔒 Restrict SSH to a single admin IP
  security_rule {
    name                       = "AllowSSH"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "${var.admin_ip}/32"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "devsecops"
    owner       = "wilfr"
  }
}
