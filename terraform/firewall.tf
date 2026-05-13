# HAProxy firewall
# Public users can access HTTP/HTTPS.
# SSH and HAProxy stats, metrics are allowed to the Control Machine private IP.
resource "digitalocean_firewall" "haproxy_fw" {
  name = "${var.project_name}-haproxy-fw"

  droplet_ids = [digitalocean_droplet.haproxy.id]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["${var.cm_private_ip}/32"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "8404"
    source_addresses = ["${var.cm_private_ip}/32"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}

# Backend firewall
# SSH is allowed only from CM.
# HTTP is allowed only from HAProxy private IP.
resource "digitalocean_firewall" "backend_fw" {
  name = "${var.project_name}-backend-fw"

  droplet_ids = [
    digitalocean_droplet.nginx.id,
    digitalocean_droplet.apache.id
  ]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["${var.cm_private_ip}/32"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["${digitalocean_droplet.haproxy.ipv4_address_private}/32"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}