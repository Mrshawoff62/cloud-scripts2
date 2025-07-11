# modules/vmss/main.tf

# Création du profil d'échelle de la machine virtuelle
resource "azurerm_virtual_machine_scale_set" "vmss" {
  name                = var.vmss_name
  location            = var.location
  resource_group_name = var.resource_group_name
  
  # Configuration de l'upgrade
  upgrade_policy_mode = "Automatic"

  # Configuration du SKU
  sku {
    name     = var.vm_size
    tier     = "Standard"
    capacity = var.instance_count
  }

  # Configuration de la source de l'image
  storage_profile_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  # Configuration du stockage
  storage_profile_os_disk {
    name              = ""
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  # Configuration du système d'exploitation avec installation Apache2
  os_profile {
    computer_name_prefix = "vmss"
    admin_username       = var.admin_username
    admin_password       = var.admin_password 
    custom_data = base64encode(<<-EOF
    #cloud-config
    package_update: true
    packages:
      - apache2
      - php
      - php-mysql 
      - git
    runcmd:
      - systemctl enable apache2
      - systemctl start apache2
      - rm -rf /var/www/html/*
      - git clone https://github.com/Mrshawoff/Formation-WEB.git /var/www/html
      - chown -R www-data:www-data /var/www/html
    EOF
    )
  }

  # Configuration de l'interface réseau
  network_profile {
    name    = "networkprofile"
    primary = true

    ip_configuration {
      name                                   = "ipconfig"
      primary                                = true
      subnet_id                              = var.subnet_id
      load_balancer_backend_address_pool_ids = [var.backend_pool_id]
    }
  }

  # Configuration des paramètres d'authentification SSH
  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = var.tags
}

# Création de la règle d'autoscale basée sur le trafic réseau
resource "azurerm_monitor_autoscale_setting" "autoscale" {
  name                = "${var.vmss_name}-autoscale"
  resource_group_name = var.resource_group_name
  location            = var.location
  target_resource_id  = azurerm_virtual_machine_scale_set.vmss.id

  profile {
    name = "NetworkBasedAutoScale"

    capacity {
      default = var.instance_count
      minimum = var.scale_min
      maximum = var.scale_max
    }

    # Règle pour augmenter le nombre d'instances basée sur le trafic réseau entrant
    rule {
      metric_trigger {
        metric_name        = "Network In Total"
        metric_resource_id = azurerm_virtual_machine_scale_set.vmss.id
        time_grain         = "PT1M"
        statistic          = "Sum"
        time_window        = "PT5M"
        time_aggregation   = "Total"
        operator           = "GreaterThan"
        threshold          = var.network_maxbytes
      }

      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT5M"
      }
    }

    # Règle pour diminuer le nombre d'instances si le trafic réseau est faible
    rule {
      metric_trigger {
        metric_name        = "Network In Total"
        metric_resource_id = azurerm_virtual_machine_scale_set.vmss.id
        time_grain         = "PT1M"
        statistic          = "Sum"
        time_window        = "PT5M"
        time_aggregation   = "Total"
        operator           = "LessThan"
        threshold          = var.network_minbytes
      }

      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT5M"
      }
    }
  }

  tags = var.tags
}