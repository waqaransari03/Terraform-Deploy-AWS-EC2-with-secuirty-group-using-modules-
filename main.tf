provider "aws" {
	region = "us-east-1"
	profile = "Waqar"
}

module "sg_module" {
	sg_name = "sg_ec2_${local.env}"
	source = "./sg_module"
}

module "ec2_module" {
	my_sg_group = module.sg_module.sg_output
	aws-ec2_name = "prac_ec2"	
	source = "./ec2_module"
}

locals {
	env = terraform.workspace
	
	amiid_env = {
	default = "amiid_default"
	staging = "amiid_staging"
	production = "amiid_production"
}
	amiid = lookup(local.amiid_env, local.env)
}

output "myamiid" {
	value = local.amiid
}
