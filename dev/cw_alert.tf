resource "aws_cloudwatch_metric_alarm" "ec2_cpu_utilization_high" {
  alarm_name          = "${local.app_name}-high-cpu-utilization"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  
  threshold           = 60
  
  alarm_description = "This alarm fires when the EC2 instance CPU utilization exceeds 1% for 1 minute."
  
  alarm_actions       = [module.mctv_airflow_chatbot_slack.sns_topic_arn]
  
  dimensions = {
    InstanceId = module.spacelift_demo.instance_id
  }

  tags = local.common_tags
}