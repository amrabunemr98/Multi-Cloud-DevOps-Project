
#######################################################
#                       CloudWatch Alarm              #
#######################################################
# SNS Topic for CloudWatch Alarms
resource "aws_sns_topic" "topic" {
  name = "topic-name"
}

resource "aws_sns_topic_subscription" "email-target" {
  topic_arn = aws_sns_topic.topic.arn
  protocol  = "email"
  endpoint  = var.email
}

resource "aws_iam_policy" "cloudwatch_alarm_policy" {
  name        = "CloudWatchAlarmPolicy"
  description = "IAM policy for CloudWatch Alarms"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = [
        "SNS:Publish"
      ],
      Effect   = "Allow",
      Resource = aws_sns_topic.topic.arn
    }]
  })
}


# IAM Role for CloudWatch Alarms
resource "aws_iam_role" "cloudwatch_alarm_role" {
  name = "CloudWatchAlarmRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "cloudwatch.amazonaws.com"
      }
    }]
  })
}

# Attach IAM Policy to IAM Role
resource "aws_iam_role_policy_attachment" "cloudwatch_alarm_role_attachment" {
  policy_arn = aws_iam_policy.cloudwatch_alarm_policy.arn
  role       = aws_iam_role.cloudwatch_alarm_role.name
}




# CloudWatch Metric Alarm for CPUUtilization
resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  alarm_name          = "CPUAlarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = var.time
  statistic           = "Average"
  threshold           = "80"
  alarm_description   = "Alarm if CPU exceeds 80% for 2 consecutive periods"
  actions_enabled     = true

  dimensions = {
    InstanceId = var.ec2
  }

  alarm_actions = [aws_sns_topic.topic.arn]
}

#######################################################
#                       CloudWatch Logs               #
#######################################################
# CloudWatch Logs Group
resource "aws_cloudwatch_log_group" "logs_group" {
  name              = "/var/log/messages"
  retention_in_days = 30
}

# CloudWatch Logs Stream
resource "aws_cloudwatch_log_stream" "logs_stream" {
  name           = "ec2-logs-stream"
  log_group_name = aws_cloudwatch_log_group.logs_group.name
}



