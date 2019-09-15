variable "project" {
  default = ""
}

variable "ssh_user" {                                                                                                                                                                                                
}

variable "ssh_filename" {                                                                                                                                                                                            
}

variable "script_path" {
}

provider "google" {
  project = var.project
  region  = "europe-west4"
  zone    = "europe-west4-c"
}

resource "google_compute_instance" "vm_instance" {                                                                                                                             
  name                    = "terraform-instance"                                                                                                                               
  machine_type            = "n1-standard-1"                                                                                                                                    
  metadata = {                                                                                                                                                                 
    ssh-keys = "${var.ssh_user}:${file("${var.ssh_filename}")}" 
    startup-script = "${file("${var.script_path}")}"
  }

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-bionic-v20190813a"
    }
  } 

  network_interface {
    # A default network is created for all GCP projects
    network       = "${google_compute_network.vpc_network.self_link}"
    access_config {
    }
  }
}

resource "google_compute_network" "vpc_network" {
  name                    = "terraform-network"
  auto_create_subnetworks = "true"
}

resource "google_compute_firewall" "terraform-network-ssh" {
  name    = "allow-all-vpc-ssh"
  network = "${google_compute_network.vpc_network.name}"
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "terraform-network-https" {
  name    = "allow-all-vpc-novnc-https"
  network = "${google_compute_network.vpc_network.name}"
  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
  source_ranges = ["0.0.0.0/0"]
}

output "VNC_Server_Url" {
  value       = "https://${google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip}/vnc.html"
  description = "VNC web server url"
}
