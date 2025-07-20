# output "s3_website_url" {
#   description = "Public website endpoint for the S3 bucket"
#   value       = "http://${aws_s3_bucket.static_site.bucket}.s3-website-${var.region}.amazonaws.com"
# }

output "s3_website_url" {
  description = "S3 static website endpoint"
  value       = aws_s3_bucket_website_configuration.website.website_endpoint
}


output "cloudfront_distribution_id" {
  description = "ID of the CloudFront distribution"
  value       = aws_cloudfront_distribution.cdn.id
}

output "cloudfront_domain_name" {
  description = "URL for accessing the site via CloudFront"
  value       = "https://${aws_cloudfront_distribution.cdn.domain_name}"
}

output "acm_dns_validation_records" {
  description = "ACM DNS validation CNAME records (use to verify cert)"
  value = [
    for dvo in aws_acm_certificate.wildcard_cert.domain_validation_options : {
      domain_name = dvo.domain_name
      resource_record_name = dvo.resource_record_name
      resource_record_type = dvo.resource_record_type
      resource_record_value = dvo.resource_record_value
    }
  ]
}
