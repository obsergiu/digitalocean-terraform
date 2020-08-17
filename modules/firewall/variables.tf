variable "firewall_name" {
  type = string
  default = "http-firewall"
}

variable "droplet_ids" {
  type = list(string)
  description = "List of droplets IDs to whom the firewall will be applied"
}


variable "ssh_port" {
  type = number
}

variable "ssh_user" {
  type = string
}

# list of allowed IP's into Firewall
variable "fw_ssh_ips" {
  type = list(string)
}