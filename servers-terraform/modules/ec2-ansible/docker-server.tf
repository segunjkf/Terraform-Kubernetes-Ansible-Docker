resource "aws_instance" "docker" {
  ami                         = data.aws_ami.linux-image.id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id_2
  availability_zone           = var.availability_zone
  vpc_security_group_ids      = var.security_id2
  key_name                    = aws_key_pair.deployer.key_name
  associate_public_ip_address = true
  tags = {
    Name = "docker"
  }
}