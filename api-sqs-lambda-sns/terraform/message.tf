# SQS
resource "aws_sqs_queue" "xray-sqs-queue" {
  name = "xray-sqs-queue"
  delay_seconds = 10
  max_message_size = 256
  message_retention_seconds = 345600
}

# SNS
resource "aws_sns_topic" "xray-sns-topic" {
  name = "xray-sns-topic"
}

resoure "aws_sns_topic_subscription" "xray-sns-subscription" {
  name = "xray-sns-subscription"
}