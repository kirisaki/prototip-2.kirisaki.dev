resource "google_container_cluster" "primary"{
  name = "prototip-2-cluster"
  provider = google-beta
  project = var.project
  location = var.zone

  remove_default_node_pool = true
  initial_node_count = 1
}

resource "google_container_node_pool" "primary_nodes" {
  name = "prototip-2-pool"
  provider = google-beta
  project = var.project
  location = var.zone
  cluster = google_container_cluster.primary.name
  node_count = 1

  management {
    auto_repair = true
  }

  node_config {
    machine_type = "e2-micro"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "prototip-2-preemptible"
  provider = google-beta
  project = var.project
  location   = var.zone
  cluster    = google_container_cluster.primary.name
  node_count = 2

  management {
    auto_repair = true
  }

  node_config {
    preemptible  = true
    machine_type = "e2-micro"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
