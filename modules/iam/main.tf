resource "aws_iam_role" "inspector_event_role" {
  name  = "inspector-event-role-${var.random_id_prefix}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "events.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

data "aws_iam_policy_document" "inspector_event_role_policy" {
  statement {
    sid = "StartAssessment"
    actions = [
      "inspector:StartAssessmentRun",
    ]
    resources = [
      "*"
    ]
  }
}

resource "aws_iam_role_policy" "inspector_event" {
  name   = "inspector-event-policy-${var.random_id_prefix}"
  role   = aws_iam_role.inspector_event_role.id
  policy = data.aws_iam_policy_document.inspector_event_role_policy.json
}