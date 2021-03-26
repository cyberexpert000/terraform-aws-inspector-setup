variable "region" {
  description = "us-east-1"
}

/*====
environment specific variables
======*/
variable "environment" {
  description = "The Deployment environment"
}

variable "schedule_expression" {
  description = "schedule expression for cloudwatch rule to start Inspector scan"
}

variable "rule_list" {
  type        = list(any)
  description = "Rule list"
}