resource "random_id" "random_id_prefix" {
	byte_length = 2
}

data "aws_availability_zones" "available" {
	state = "available"
}

locals {
	production_availability_zones = "${data.aws_availability_zones.available.names}"
}

module "Inspector" {
	source = "./modules/inspector"

	region            = "${var.region}"
	environment       = "${var.environment}"
	random_id_prefix  = "${random_id.random_id_prefix.hex}"
	rule_list                     = var.rule_list
}

module "Cloudwatch" {
	source = "./modules/cloudwatch"

	region            = "${var.region}"
	environment       = "${var.environment}"
	random_id_prefix  = "${random_id.random_id_prefix.hex}"
	
	schedule_expression 							= "${var.schedule_expression}"
	inspector_assessment_template_arn = "${module.Inspector.inspector_assessment_template_arn}"
	inspector_event_role_arn 					= "${module.EC2IamRole.inspector_event_role_arn}"
}

module "EC2IamRole" {
	source = "./modules/iam"

	region            = "${var.region}"
	environment       = "${var.environment}"
	random_id_prefix  = "${random_id.random_id_prefix.hex}"
}