# Upload CM public key so CM can SSH into provisioned servers
resource "digitalocean_ssh_key" "cm_key" {
  name       = "${var.project_name}-cm-key"
  public_key = file(var.ssh_public_key_path)
}

resource "digitalocean_droplet" "haproxy" {
  name     = "${var.project_name}-haproxy"
  region   = var.region
  size     = "s-1vcpu-1gb"
  image    = var.image
  vpc_uuid = var.existing_vpc_uuid

  ssh_keys = [digitalocean_ssh_key.cm_key.id]

  tags = ["${var.project_name}", "haproxy"]
}

resource "digitalocean_droplet" "nginx" {
  name     = "${var.project_name}-nginx"
  region   = var.region
  size     = var.droplet_size
  image    = var.image
  vpc_uuid = var.existing_vpc_uuid

  ssh_keys = [digitalocean_ssh_key.cm_key.id]

  tags = ["${var.project_name}", "backend", "nginx"]
}

resource "digitalocean_droplet" "apache" {
  name     = "${var.project_name}-apache"
  region   = var.region
  size     = var.droplet_size
  image    = var.image
  vpc_uuid = var.existing_vpc_uuid

  ssh_keys = [digitalocean_ssh_key.cm_key.id]

  tags = ["${var.project_name}", "backend", "apache"]
}