variable location {
    description = "location for resources"
    type = string
    default = "eastus2"
}

variable "kubernetes_version" {
  description = "default version for cluster"
  type = string
  default = "1.22"
}

variable "ssh_key" {
  description = "ssh keys for decrypting vm scale sets"
  type = string
}
