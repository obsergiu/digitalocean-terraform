output "ip" {
    value = digitalocean_droplet.ndc.ipv4_address
}

output "ssh" {
  value = "ssh -p ${var.ssh_port} ${var.ssh_user}@${digitalocean_droplet.ndc.ipv4_address}"
}