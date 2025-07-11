# modules/vmss/outputs.tf

output "vmss_id" {
  value = azurerm_virtual_machine_scale_set.vmss.id
}

output "vmss_name" {
  value = azurerm_virtual_machine_scale_set.vmss.name
}

output "autoscale_setting_id" {
  value = azurerm_monitor_autoscale_setting.autoscale.id
}