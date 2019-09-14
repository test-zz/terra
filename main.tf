variable "project" {
  default = ""
}
provider "google" {
  project = var.project
  region  = "europe-west4"
  zone    = "europe-west-4d"
}
resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "n1-standard-1"
  boot_disk {
    initialize_params {
      image = "gce-uefi-images/ubuntu-1804-bionic-v20190813a"
    }
  }
  network_interface {
    # A default network is created for all GCP projects
    network       = "default"
    access_config {
    }
  }
}
