################################################################################
# Firewall Rules for our Webserver Droplets                                    #
################################################################################
resource "digitalocean_firewall" "ndc" {

  # The name we give our firewall for ease of use                            #
  name = var.firewall_name

  # The droplets to apply this firewall to                                   #
  droplet_ids = var.droplet_ids


  #--------------------------------------------------------------------------#
  # Inbound Traffic Rules                                         #
  #--------------------------------------------------------------------------#
  # SSH
  inbound_rule {
    protocol = "tcp"
    port_range = var.ssh_port
    source_addresses = var.fw_ssh_ips
  }

  # HTTP
  inbound_rule {
    protocol = "tcp"
    port_range = "80"
    source_addresses = [
      "0.0.0.0/0",
      "::0"]
  }

  # HTTPS
  inbound_rule {
    protocol = "tcp"
    port_range = "443"
    source_addresses = [
      "0.0.0.0/0",
      "::0"]
  }


  # PGP key
  inbound_rule {
    protocol = "tcp"
    port_range = "11371"
    source_addresses = [
      "0.0.0.0/0",
      "::0"]
  }


  #--------------------------------------------------------------------------#
  # Selective Outbound Traffic Rules                                         #
  #--------------------------------------------------------------------------#
  # HTTP
  outbound_rule {
    protocol = "tcp"
    port_range = "80"
    destination_addresses = [
      "0.0.0.0/0",
      "::/0"]
  }

  # HTTPS
  outbound_rule {
    protocol = "tcp"
    port_range = "443"
    destination_addresses = [
      "0.0.0.0/0",
      "::/0"]
  }

  # DNS
  outbound_rule {
    protocol = "udp"
    port_range = "53"
    destination_addresses = [
      "0.0.0.0/0",
      "::/0"]
  }

  # ICMP (Ping)
  outbound_rule {
    protocol = "icmp"
    destination_addresses = [
      "0.0.0.0/0",
      "::/0"]
  }

  # PGP key
  outbound_rule {
    protocol = "tcp"
    port_range = "11371"
    destination_addresses = [
      "0.0.0.0/0",
      "::/0"]
  }
}


################################################################################
# Specify that only the named droplet can access the database.                 #
################################################################################
### DISABLED: while building additional functionality
#resource "digitalocean_database_firewall" "ndc-mysql" {

# Database cluster ID to associate this firewall rule with
#    cluster_id = data.digitalocean_database_cluster.ndc-mysql.id
#    rule {
#        type  = "droplet"
#        value = digitalocean_droplet.ndc.id
#    }
#}
