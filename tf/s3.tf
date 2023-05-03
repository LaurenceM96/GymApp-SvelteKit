
resource "aws_s3_bucket" "spa-app-bkt" {
  bucket        = var.spa-app-bkt
  acl           = "private"
  force_destroy = var.s3_force_destroy
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket" "static-data-bkt" {
  bucket        = var.static-data-bkt
  acl           = "private"
  force_destroy = var.s3_force_destroy
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

data "archive_file" "main" {
  type = "zip"
  source_dir = "../build"
  output_path = "${path.module}/build.zip"
}

resource "null_resource" "deploy" {
  triggers = {
    build_hash = data.archive_file.main.output_base64sha256
  }

  provisioner "local-exec" {
    command = "aws s3 sync ../build s3://${aws_s3_bucket.spa-app-bkt.id}"
  }
}

resource "null_resource" "invalidate" {
  depends_on = [
    null_resource.deploy
  ]

  triggers = {
    build_hash = data.archive_file.main.output_base64sha256
  }

  provisioner "local-exec" {
    command = "aws cloudfront create-invalidation --distribution-id ${aws_cloudfront_distribution.web_distribution.id} --paths '/*' >/dev/null;"
  }
}