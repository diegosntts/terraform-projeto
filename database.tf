
resource "digitalocean_database_cluster" "postgres" {
  name       = var.pg_cluster_name
  engine     = "pg"
  version    = var.pg_cluster_version
  size       = var.pg_cluster_size
  region     = var.datacenter_region
  node_count = var.pg_node_count
}

resource "digitalocean_database_db" "database" {
  cluster_id = digitalocean_database_cluster.postgres.id
  name       = var.database_name
}

resource "digitalocean_database_user" "username" {
  cluster_id = digitalocean_database_cluster.postgres.id
  name       = var.database_username
}
