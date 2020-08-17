
# require token for connecting to DO
do_token = "6ddb556511dcb4---GET-THE-KEY-FROM-DO---5cda878cc87ca"
# required SSH key to connect to new created droplet
# You can find/add it in DO account: Settings > Security > SSH Keys
ssh_key_name = "key-for-terraform"

#data to build
project_name = "NDC"
droplet_name = "ndc-srv"
droplet_image = "ubuntu-20-04-x64"
region = "lon1"
droplet_size = "s-1vcpu-1gb"

# firewall settings
firewall_name = "ndc-fw"
fw_ssh_ips = ["127.0.0.1", "my-local-ip"]

# logins for main user
ssh_user = "mySrvUser"
## needs to be changed to something bigger than 1024
ssh_port = 2222
# loads the default key
ssh_public_key = "~/.ssh/id_rsa.pub"
# to ssh inside the server - the pair from DO
ssh_pvt_key = "./.ssh/key-for-terraform.key"