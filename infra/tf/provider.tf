terraform {
  required_version = "= 1.5.0"

  backend "consul" {
    address = "http://REDACTED"
    lock    = true
    path    = "terraform-state/proxmox/kubernetes/kube-playground.tfstate"
    scheme  = "http"
  }
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.11"
    }
  }
}

provider "proxmox" {
  pm_api_url      = "https://REDACTED/api2/json"
  pm_tls_insecure = true
  pm_log_enable   = true
  pm_log_file     = ".terraform-plugin-proxmox.log"
}
