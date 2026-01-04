resource "aws_instance" "ec2" {
  # Garde ton AMI mais on va ajouter un cycle de vie pour ignorer les changements
  ami           = "ami-0150ccaf51ab55a51"
  instance_type = "t2.large"
  key_name      = "vockey" # Assure-toi que c'est bien "vockey" pour le Lab
  subnet_id     = "subnet-015267132efe8ba17"

  iam_instance_profile = "LabInstanceProfile"

  root_block_device {
    volume_size = 30
    volume_type = "gp2"
  }

  # AJOUTE CE BLOC ICI pour empêcher Terraform de vouloir vérifier l'AMI
  lifecycle {
    ignore_changes = [ami]
  }

  user_data = templatefile("./install-tools.sh", {})

  tags = {
    Name = "Jumphost-server"
  }
}
