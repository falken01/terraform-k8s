resource "azurerm_resource_group" "aks_group" {
  location = var.location
  name = "aks_group"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name = "aks_test"
  location = var.location
  resource_group_name = azurerm_resource_group.aks_group.name
  dns_prefix = "aks-cg"
  kubernetes_version = var.kubernetes_version
  http_application_routing_enabled = false
#   aci_connector_linux = false ???
#   kube_dashboard = false
#   
    default_node_pool {
        name = "nodepool"
        node_count  = 2
        vm_size = "Standard_E4s_v3"
        type = "VirtualMachineScaleSets"
        os_disk_size_gb = 32
    }
    identity {
        type = "SystemAssigned"
    }
    linux_profile {
        admin_username = "adminuser"
        ssh_key {
            key_data = var.ssh_key
        }
    }
    network_profile{
        network_plugin = "kubenet"
        load_balancer_sku = "standard"
    }
}

resource "azurerm_kubernetes_cluster_node_pool" "monitoring" {
    name="monitoring"
    node_count=1
    vm_size = "Standard_E4s_v3"
    kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
    os_disk_size_gb = 32
    os_type = "Linux"
}