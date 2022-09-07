resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = var.env
  }
}

# Will use default VPC: it's simple and fast. The only thing needs to ensure - networks in each AZ.
resource "aws_subnet" "vpc_networks" {
  for_each = var.vpc_networks
  vpc_id     = aws_vpc.main.id
  availability_zone = each.key
  cidr_block = each.value
  map_public_ip_on_launch = true

  tags = {
    "Name" = "Lab-8 project network ${each.key}"
    // enable ELB for any network we have:
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/${var.k8s_cluster_name}" = "shared"
  }
}



