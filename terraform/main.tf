# I set the credential file in `~/.aws/credentials` with dedicated profile called `gd`. 
# You can setup yours in "lab-8.tfvars".
provider "aws" {
  region                      = var.region
  
  shared_credentials_file = var.credentials_file
  profile = var.aws_profile

  // skip_credentials_validation = true
  // skip_metadata_api_check     = true
  // skip_requesting_account_id  = true
}

# To have access to VMs directly.
# Will not setup any bastion hosts because of SecurityGroups. In GCP, again, we have Identity-Aware Proxy, which can setup an ssh tunnel to any VM even without externalIP.
resource "aws_key_pair" "devops_lab_8" {
  key_name   = "devops_lab_8"
  public_key = var.devops_keypair
}
