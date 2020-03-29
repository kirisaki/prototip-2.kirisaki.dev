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

resource "google_sourcerepo_repository" "gke_env" {
  provider = google-beta
  project = var.project
  name = "prototip-2-env"
}

