################################################################################
# Template:: load variables from settings into cloud-init.yaml                 #
################################################################################
data "template_file" "cloud-init-yaml" {
  template = file("${path.module}/config/cloud-init.yaml")
  vars = {
    init_ssh_public_key = file(var.ssh_public_key)
    init_ssh_port = var.ssh_port
    init_ssh_user = var.ssh_user
    # take only the first IP
    init_ssh_ip = element(var.fw_ssh_ips, 0)
  }
}