resource "aws_cloudwatch_log_group" "ecs" {
  name              = "/ecs/predict-api"
  retention_in_days = 7
}
