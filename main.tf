terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.0"
    }
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id

  features {}
}

module "cluster" {
  source               = "./modules/cluster"
  location             = var.location
  kubernetes_version   = var.kubernetes_version
  ssh_key              = var.ssh_key
}

module "k8s" {
  source                 = "./modules/k8s/"
  host                   = module.cluster.host
  client_certificate     = base64decode(module.cluster.client_certificate)
  client_key             = base64decode(module.cluster.client_key)
  cluster_ca_certificate = base64decode(module.cluster.cluster_ca_certificate)
}