//set up an vm instance in gcp
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  credentials = file("jsonfile")
  project     = "project_name"
  region      = "us-east1"
  zone        = "us-east1-b"
}

resource "google_compute_instance" "vm_instance" {
  name         = "jenkins"
  machine_type = "e2-small"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {
      //Ephemeral public IP
    }
}
}
