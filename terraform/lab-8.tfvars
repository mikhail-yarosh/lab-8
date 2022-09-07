credentials_file = "~/.aws/credentials"
env = "lab-8"
region = "eu-south-1"
aws_profile = "gd"
vpc_cidr = "172.31.0.0/16"
devops_keypair = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDCJqryQzVBqSzJg2Gozg/e/FBPpj0/rZfe0iEb/Yhj7CAbAEwAoAALJxg0iKjKfPhOK520G3xtYDRFVmFB/ctHtILlHlyBNnAf7zwjon8atc795nOhGzk7Tk85ncCunvEopiPY459DnONU8RAvyEIc40JEFWAtVD0mksfzflO2RHaXbpi6H8XlFEHNB82pOsiRq6halpLoZLdD/MWmKtYKkSEqwnaI3T5+6X9Md2zbvNLSQASbg5gdArbN1rqSjhZTWSqTS6N+cFVfS9IiCInkAy0nkhNUsIXmIz9aFCR5x0tpXjRF7Tb6XXKQYbHla10/AncW0rcNZblCIm34clfmhCoPuKMeasy6H+eZVKDDvE9Yev8k7LTy6tm8I6HFL9i+ohBouUzjwIF31qixd74TocA3360dHIR/7VzS8PhuD2SRttYgy7fZ4ielcZywKvtBRrMQlMhPK0YkyFHp0gGB069VnqscnpdkXyeNOe5hmW07g/R0GIa1N/xvgjH6av24mP9bk62QlVTt/5SEGjIX16eYmlCIbThEIEtOHDKFjqiBkEBmxXwY+ggINIBK0l4DesmNNvTvcl1SR57ho2xzmrnUGVE418VTN4tTFfEw7NG17feqlgBsxMO2DO/QzZ5tq2Th5RuoGNmiXILOTqwn7s/cGt7zneiWdLphViPbXQ== Mike Iarosh"
devops_allowed_networks = ["109.230.132.80/32"]
// docker_instance_type = "t3.small"
// docker_ws_instance_type = "t3.small"
k8s_instance_type = ["t3.small"]
k8s_cluster_name = "lab-8"
k8s_node_pool_name = "lab-8-nodes"
vpc_networks = {
  "eu-south-1a" = "172.31.0.0/18"
  "eu-south-1b" = "172.31.64.0/18"
  "eu-south-1c" = "172.31.128.0/18"
}

