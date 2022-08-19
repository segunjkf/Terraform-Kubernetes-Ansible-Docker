data "aws_ami" "linux-image" {
    most_recent = true 
    owners = ["amazon"]
    filter {
        name = "name"
        values = [var.image_name]

    }
    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }

}

resource "aws_instance" "ansible" {
  ami           = data.aws_ami.linux-image.id
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  availability_zone = var.availability_zone
  vpc_security_group_ids = var.security_id
  user_data = "${file("ec2-userdata.sh")}"
  key_name = aws_key_pair.deployer.key_name
  tags = {
    Name = "ansible"
  }
}