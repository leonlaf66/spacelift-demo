module "mctv_airflow_chatbot_slack" {
  source = "git::https://github.com/leonlaf66/aws-chatbot-module.git?ref=init"
  app_name                  = local.app_name
  slack_team_id             = "T09EKMESRT8"
  slack_channel_id          = "C09EKMN02QN"
  common_tags               = merge(local.common_tags, { Component = "Chatbot test" })
}