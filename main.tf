provider "aws" {
	region = "us-east-1"
	profile = "Waqar"
}

module "sg_module" {
	source = "./sg_module"
}

module "ec2_module" {
	my_sg_group = module.sg_module.sg_output
	aws-ec2_name = "prac_ec2"	
	source = "./ec2_module"
}

