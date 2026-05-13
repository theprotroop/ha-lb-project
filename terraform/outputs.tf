output "haproxy_public_ip" {
  value = digitalocean_droplet.haproxy.ipv4_address
}

output "haproxy_private_ip" {
  value = digitalocean_droplet.haproxy.ipv4_address_private
}

output "nginx_private_ip" {
  value = digitalocean_droplet.nginx.ipv4_address_private
}

output "apache_private_ip" {
  value = digitalocean_droplet.apache.ipv4_address_private
}