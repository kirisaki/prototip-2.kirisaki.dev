variable "project" {}
variable "region" {}

terraform {
  backend "gcs" {
    bucket = "klaraworks-tfstate"
    path   = "prototip-2.tfstate"
    credentials = "../../../secrets/klaraworks-tfstate.json"
  }
}

provider "google-beta" {
  credentials = file("../../../secrets/prototip-2-terraformer.json")
  project     = var.project
  region      = var.region
  version     = "~> 3.14.0"
}

resource "google_cloudbuild_trigger" "default" {
  provider = google-beta
  project = var.project
  github {
    owner = "kirisaki"
    name = "prototip-2.kirisaki.dev"
    push {
      tag = "[0-9]+\\.[0-9]+\\.[0-9]"
    }
  }
  filename = "cloudbuild.yaml"
}

resource "google_storage_bucket" "cache" {
  provider = google-beta
  name = "prototip-2-cache"
  project = var.project
  location = "asia-northeast1"
}
