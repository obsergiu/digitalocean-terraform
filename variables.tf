################################################################################
# Variables section:: Default values to be used in the project                 #
################################################################################
variable "do_token" {
  type = string
  description = "DigitalOcean API token"
}

# The region to deploy our infrastructure to.
variable "region" {
  type    = string
  default = "lon1"
}

variable "project_name" {
  type = string
  description = "Attache the resources to declared project"
  default = "NDC"
}

variable "droplet_image" {
  type = string
  description = "OS to be used"
  default = "ubuntu-20-04-x64"
}

variable "droplet_name" {
  type = string
  description = "Name given to droplet"
}

# required to be provided
variable "droplet_size" {
  type = string
  description = "Droplet size - will cost money, be careful"
}



variable "ssh_key_name" {
  type    = string
  description = "SSH key name from account"
}

variable "ssh_pvt_key" {
  type = string
  description = "The path to private SSH key that is used in combination with DO account public key"
}

variable "ssh_public_key" {
  type = string
  default = "~/.ssh/id_rsa.pub"
  description = "The SSH key will be uploaded to the server so you can authenticate with it"
}


# Tags for the project. Will be prepended to most attached resources.
variable "tags" {
  type = list(string)
  default = ["ndc"]
}

# required to be provided
variable "firewall_name" {
  type =  string
}

variable "ssh_port" {
  type = number
}

variable "ssh_user" {
  type = string
}

# list of allowed IP's into Firewall
variable "fw_ssh_ips" {
  type = list
}

#### Additional resources
variable "vpc_name" {
  type    = string
  default = "ndc-vpc"
}

variable "volume_name" {
  type    = string
  default = "ndc-vol"
}

variable "mysql_cluster_name" {
  type    = string
  default = "ndc-mysql"
}
