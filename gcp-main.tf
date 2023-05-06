
resource "google_artifact_registry_repository" "my-repo1" {
  location = var.region
  repository_id = "hackathon-9aso-frontend"
  description = "Imagens Docker"
  format = "DOCKER"
}

resource "google_artifact_registry_repository" "my-repo2" {
  location = var.region
  repository_id = "hackathon-9aso-backend"
  description = "Imagens Docker"
  format = "DOCKER"
}

resource "google_sql_database" "database" {
  name     = "playlist"
  instance = google_sql_database_instance.instance.name
}

# See versions at https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance#database_version
resource "google_sql_database_instance" "instance" {
  name             = "my-playlist-instance"
  region           = "us-central1"
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
  }

  deletion_protection  = "true"
}