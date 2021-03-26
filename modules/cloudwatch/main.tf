resource "aws_cloudwatch_event_rule" "inspector_event_schedule" {
  name                = "inspector-schedule-cloudwatch-event-rule${var.random_id_prefix}"
  description         = "Trigger an Inspector Assessment"
  schedule_expression = var.schedule_expression
}

resource "aws_cloudwatch_event_target" "inspector_event_target" {
  rule     = aws_cloudwatch_event_rule.inspector_event_schedule.name
  arn      = var.inspector_assessment_template_arn
  role_arn = var.inspector_event_role_arn
}