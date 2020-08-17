################################################################################
# DATA section:: Retrieve data from DO to be used in provider                  #
################################################################################
# Get the project where everything is built into - we're going to use the "urn"
data "digitalocean_project" "ndc-prj" {
  name = var.project_name
}

# This data source provides the name, public key, and fingerprint as configured on DigitalOcean account.
data "digitalocean_ssh_key" "ndc-ssh" {
  name = var.ssh_key_name
}
### DISABLED - for testing
# Get the VPC - Virtual Private Cloud (VPC) is a logically isolated network
#data "digitalocean_vpc" "ndc-vpc" {
#  name   = var.vpc_name
#}

# Volume to be mounted
#data "digitalocean_volume" "ndc-volume" {
#  name   = var.volume_name
#  region = var.region
#}

# the mysql cluster
#data "digitalocean_database_cluster" "ndc-mysql" {
#  name = var.mysql_cluster_name
#}