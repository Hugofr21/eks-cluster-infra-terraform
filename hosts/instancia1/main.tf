resource "aws_instance" "host" {
  ami                       = var.ami_id
  instance_type             = var.instance_type
  subnet_id                 = var.private_subnet_ids[0]
  key_name                  = var.key_name
  availability_zone         = var.availability_zone
  associate_public_ip_address = false
  user_data                 = data.template_file.cloud_init.rendered

  tags = {
    Name = "${var.cluster_name}-instance"
  }
}


# ENIs privadas adicionais para múltiplas zonas
resource "aws_network_interface" "private_eni" {
  for_each       = toset(var.private_subnet_ids)
  subnet_id      = each.value
  security_groups = var.security_groups
  tags = {
    Name = "${var.cluster_name}-private-eni-${each.value}"
  }
}

# Anexar ENIs privadas à instância
resource "aws_network_interface_attachment" "attach_private_eni" {
  for_each              = aws_network_interface.private_eni
  instance_id           = aws_instance.host.id
  network_interface_id  = each.value.id
  device_index          = 1 + index(var.private_subnet_ids, each.key)
}

# ENI pública
resource "aws_network_interface" "public_eni" {
  subnet_id       = var.public_subnet_id
  private_ips     = ["10.0.64.10"]
  security_groups = var.security_groups

  tags = {
    Name = "${var.cluster_name}-public-eni"
  }
}

resource "aws_eip" "public_ip" {
  domain            = "vpc"
  network_interface = aws_network_interface.public_eni.id

  tags = {
    Name = "${var.cluster_name}-eip"
  }
}

resource "aws_network_interface_attachment" "attach_public" {
  instance_id          = aws_instance.host.id
  network_interface_id = aws_network_interface.public_eni.id
  device_index         = 0
}

# Cloud-init
data "template_file" "cloud_init" {
  template = file("${path.module}/../runcmd/cloud_init.tpl")
  vars = {
    install_script = file("${path.module}/../scripts/install.sh")
    private_key    = var.cluster_ssh_private
    public_key     = var.cluster_ssh_public
    user           = var.ssh_user
  }
}