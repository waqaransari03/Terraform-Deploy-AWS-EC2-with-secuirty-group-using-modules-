variable "myvpc" {
        type = string
        default = "vpc-4b9af431"
}

variable "sg_name" {
}
resource "aws_security_group" "mygroup" {
        name = var.sg_name
        description = "abc"
        vpc_id = var.myvpc

        ingress {
                from_port = 22
                to_port = 22
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
}
        egress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
}
}

output "sg_output" {
	value = aws_security_group.mygroup.id
}
