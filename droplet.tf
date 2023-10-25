terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}

resource "digitalocean_droplet" "web" {
  image    = var.droplet_image
  name     = var.droplet_names[count.index]
  region   = var.datacenter_region
  size     = var.droplet_size
  ssh_keys = var.droplet_ssh_keys
  tags     = ["webserver"]

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      ssh_keys,
    ]
  }
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "root"
      host        = self.ipv4_address
      timeout     = "1m"
      private_key = file(var.private_key_path)
    }
    inline = [
      "apt-get update -y",
      "curl -fsSl https://get.docker.com | sh",
      "sh get-docker.sh",
      "docker run -d -p 80:8000 -e DATABASE_URL=${digitalocean_database_cluster.postgres.uri} -e ENVIRONMENT=${var.environment_name} igordcsouza/hc-terraform"
    ]
  }
  count = length(var.droplet_names)
}
