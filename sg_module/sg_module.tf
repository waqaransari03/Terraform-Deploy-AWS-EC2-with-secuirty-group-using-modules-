variable "myvpc" {
        type = string
        default = "vpc-4b9af431"
}

resource "aws_security_group" "mygroup" {
        name = "mygroup"
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
