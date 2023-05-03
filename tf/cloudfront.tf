locals {
  spa_s3_origin_id         = "spa_distribution_origin"
  static_data_s3_origin_id = "static-data_distribution_origin"
}

resource "aws_cloudfront_function" "basic_auth" {
  name    = "basic_auth"
  runtime = "cloudfront-js-1.0"
  comment = "basic auth function"
  publish = true
  code    = file("${path.module}/headers.js")
}

resource "aws_cloudfront_distribution" "web_distribution" {
  enabled             = true
  is_ipv6_enabled     = false
  wait_for_deployment = false
  default_root_object = "index.html"
  price_class         = "PriceClass_100"

  origin {
    domain_name = aws_s3_bucket.spa-app-bkt.bucket_regional_domain_name
    origin_id   = local.spa_s3_origin_id
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.oai_spa.cloudfront_access_identity_path
    }
  }

  origin {
    domain_name = aws_s3_bucket.static-data-bkt.bucket_regional_domain_name
    origin_id   = local.static_data_s3_origin_id
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.oai_static_data.cloudfront_access_identity_path
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD", "OPTIONS"]
    target_origin_id = local.spa_s3_origin_id

    forwarded_values {
      query_string = true

      cookies {
        forward = "none"
      }
    }

    function_association {
      event_type   = "viewer-request"
      function_arn = aws_cloudfront_function.basic_auth.arn
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
}