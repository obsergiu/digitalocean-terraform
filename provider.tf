################################################################################
# MAIN info:: Declare our provider resource and provide the appropriate token  #
################################################################################
provider "digitalocean" {
  token = var.do_token
}

################################################################################
# MAIN function:: Load a droplet from an image                                 #
################################################################################
resource "digitalocean_droplet" "ndc" {
  # instead of a default image we can create a droplet from a snapshot
  #image              = data.digitalocean_image.snapshot.image
  image = var.droplet_image
  name = var.droplet_name
  region = var.region
  size = var.droplet_size

  private_networking = true
  ipv6 = true
  ssh_keys = [
    data.digitalocean_ssh_key.ndc-ssh.fingerprint]
  # Tags for identifying the droplets and allowing db firewall access
  tags = var.tags
  # What VPC to put our droplets in
  #vpc_uuid = data.digitalocean_vpc.ndc-vpc.id

  # loads the template with configurations for the server
  user_data = data.template_file.cloud-init-yaml.rendered

  connection {
    user = var.ssh_user
    port = var.ssh_port
    type = "ssh"
    private_key = file(var.ssh_pvt_key)
    timeout = "5m"
    host = digitalocean_droplet.ndc.ipv4_address
  }

  # TODO: not happy with the way the configuration files are transferred it would be
  #       perfect to find another way as sometimes it's failing
  # NGINX configuration
//  provisioner "remote-exec" {
//    # make sure the directory exists if not it will hang until if fails
//    inline = [
//      "mkdir -p /etc/nginx/sites-available /etc/nginx/sites-extra /etc/nginx/ssl"
//    ]
//  }
//  provisioner "file" {
//    source = "./config/nginx/sites-available/ndc.com.conf"
//    destination = "/etc/nginx/sites-available/ndc.com.conf"
//  }
//
//  provisioner "file" {
//    source = "./config/nginx/sites-extra"
//    destination = "/etc/nginx/sites-extra"
//  }
//  provisioner "file" {
//    source = "./config/nginx/ssl/"
//    destination = "/etc/nginx/ssl"
//  }
//
//  provisioner "remote-exec" {
//    inline = [
//      "ln -s /etc/nginx/sites-available/ndc.com.conf /etc/nginx/sites-enabled/ndc.com.conf",
//      "systemctl restart nginx"
//    ]
//  }
}

################################################################################
#  Attache the droplet to specific Project                                     #
################################################################################
resource "digitalocean_project_resources" "ndc" {
  project = data.digitalocean_project.ndc-prj.id
  resources = [
    digitalocean_droplet.ndc.urn]
}

################################################################################
#  Attache the available volume to our droplet                                 #
################################################################################
## DISABLED - while running tests
#resource "digitalocean_volume_attachment" "ndc-volume" {
#  droplet_id = digitalocean_droplet.ndc.id
#  volume_id = data.digitalocean_volume.ndc-volume.id
#}

################################################################################
#  Add Firewall module and configure a new DO Firewall                         #
################################################################################
module "firewall-module" {
  source = "./modules/firewall"

  firewall_name = "ndc-firewall"
  droplet_ids = [
    digitalocean_droplet.ndc.id]
  ssh_port = var.ssh_port
  ssh_user = var.ssh_user
  fw_ssh_ips = var.fw_ssh_ips
}