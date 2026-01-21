resource "aws_ecr_repository" "predict_api" {
  name = "predict-api"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }
}

output "ecr_repository_url" {
  value = aws_ecr_repository.predict_api.repository_url
}
