resource "aws_key_pair" "deployer" {
  key_name   = "server-key"
  public_key = "${file(var.public_key)}"



}