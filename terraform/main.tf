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

