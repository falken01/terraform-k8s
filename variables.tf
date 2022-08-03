variable "location" {
  description = "location for resources"
  type        = string
  default     = "eastus2"
}

variable "kubernetes_version" {
  description = "default version for cluster"
  type        = string
  default     = "1.22"
}

variable "ssh_key" {
  description = "ssh keys for decrypting vm scale sets"
}

variable "subscription_id" {
  description = "azure sub id"
  type        = string
}

variable "tenant_id" {
  description = "azure teneant id"
  type        = string
}