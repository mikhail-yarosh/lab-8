resource "aws_ecr_repository" "lab-8" {
  name                 = "lab-8"
  # Wanna build new version? It must be new ;) Better to set git hash as tag.
  image_tag_mutability = "IMMUTABLE"

  # Shoulb be enabled for normal project, but this is a playground ;)
  image_scanning_configuration {
    scan_on_push = false
  }
}