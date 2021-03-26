resource "aws_inspector_resource_group" "inspector_resource_group" {
  tags = {
    Name = "Name"
    Env  = "inspector_group"
  }
}

resource "aws_inspector_assessment_target" "inspector_assessment_target" {
  name               = "assessment target"
  resource_group_arn = aws_inspector_resource_group.inspector_resource_group.arn
}

resource "aws_inspector_assessment_template" "inspector_assessment_template" {
  name       = "example"
  target_arn = aws_inspector_assessment_target.inspector_assessment_target.arn
  duration   = 3600

  rules_package_arns = var.rule_list
}