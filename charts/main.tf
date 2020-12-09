data "template_file" "external-dns" {
  template = file("overrides/external-dns.tpl")
  vars = {
    region  = data.aws_region.current.name
    zone_id = data.aws_route53_zone.public.zone_id
    role_arn = data.aws_iam_role.external_dns.arn
    domain = var.domain
  }
}

data "template_file" "ingress-nginx" {
  template = file("overrides/ingress-nginx.tpl")
}

data "template_file" "prometheus-stack" {
  template = file("overrides/prometheus-stack.tpl")
  vars = {
    domain = var.domain
    grafana_password = random_password.grafana_password.result
  }
}

data "template_file" "hello-world" {
  template = file("overrides/hello-world.tpl")
  vars = {
    domain = var.domain
    statsd-exporter = "statsd-exporter.monitoring.svc.cluster.local:9125"
  }
}

data "template_file" "statsd-exporter" {
  template = file("overrides/statsd-exporter.tpl")
  vars = {
    domain = var.domain
  }
}