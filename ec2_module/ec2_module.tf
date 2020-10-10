variable "myami" {
	type = string
	default = "ami-032930428bf1abbff"
}

variable "aws-ec2_name" {
}
variable "my_sg_group" {
}
resource "aws_instance" "web" {
  ami = var.myami
  instance_type = "t3.micro"
  key_name = "ubuntu-jenkins"
  vpc_security_group_ids = [var.my_sg_group]
  tags = {
    Name = var.aws-ec2_name
  }
}
