variable "environment" {
  description = "The Deployment environment"
}

variable "random_id_prefix" {
  description = "random_id_prefix"
}

variable "region" {
  description = "region"
}

variable "rule_list" {
  type        = list(any)
  description = "Rule list"
}