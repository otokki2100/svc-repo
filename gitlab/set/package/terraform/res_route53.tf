data "aws_route53_zone" "domain" {
  name         = var.domain
  private_zone = false
}

resource "aws_route53_record" "domain_record_gitlab" {
  zone_id = data.aws_route53_zone.domain.zone_id
  name    = local.domain
  type    = "A"
  ttl     = 60
  records = [module.ec2_gitlab.public_ip]
  allow_overwrite = true
}

resource "aws_route53_record" "domain_record_gitlab_pages" {
  zone_id = data.aws_route53_zone.domain.zone_id
  name    = "*.pages.otokki.com"
  type    = "A"
  ttl     = 60
  records = [module.ec2_gitlab.public_ip]
  allow_overwrite = true
}
