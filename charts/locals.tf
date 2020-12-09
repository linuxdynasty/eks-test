locals {
  charts = {
    ingress-controller = {
      release_name              = "ingress-controller"
      repository_url            = "https://kubernetes.github.io/ingress-nginx"
      name                      = "ingress-nginx"
      version                   = "3.13.0"
      verify                    = false
      namespace                 = "ingress-controller"
      timeout                   = 300
      atomic                    = true
      max_history               = 10
      override_values           = data.template_file.ingress-nginx.rendered
      set = [
        {
          name = "nameOverride"
          value = "ingress-controller"
        },
        {
          name = "fullnameOverride"
          value = "ingress-controller"
        },
      ]
    },
    prometheus = {
      release_name              = "prometheus"
      repository_url            = "https://prometheus-community.github.io/helm-charts"
      name                      = "kube-prometheus-stack"
      version                   = "12.4.0"
      verify                    = false
      namespace                 = "monitoring"
      timeout                   = 300
      atomic                    = true
      max_history               = 10
      override_values           = data.template_file.prometheus-stack.rendered
      set = [
        {
          name = "nameOverride"
          value = "prometheus-stack"
        },
        {
          name = "fullnameOverride"
          value = "prometheus-stack"
        },
        {
          name = "nameSpaceOverride"
          value = "prometheus-stack"
        },
      ]
    },
    external-dns = {
      release_name              = "external-dns"
      repository_url            = "https://charts.bitnami.com/bitnami"
      name                      = "external-dns"
      version                   = "4.0.0"
      verify                    = false
      namespace                 = "kube-system"
      timeout                   = 300
      atomic                    = true
      max_history               = 10
      override_values           = data.template_file.external-dns.rendered
      set = [
        {
          name  = "txtOwnerId"
          value = data.aws_eks_cluster.this.id
        },
        {
          name  = "txtPrefix"
          value = data.aws_eks_cluster.this.id
        }
      ]
    },
    statsd-exporter = {
      release_name              = "statsd-exporter"
      repository_url            = "https://prometheus-community.github.io/helm-charts"
      name                      = "prometheus-statsd-exporter"
      version                   = "0.1.0"
      verify                    = false
      namespace                 = "monitoring"
      timeout                   = 300
      atomic                    = true
      max_history               = 10
      override_values           = data.template_file.statsd-exporter.rendered
      set = [
        {
          name = "nameOverride"
          value = "statsd-exporter"
        },
        {
          name = "fullnameOverride"
          value = "statsd-exporter"
        },
      ]
    },
    hello-world = {
      release_name              = "hello-world"
      repository_url            = "./local_charts/"
      name                      = "hello-world-chart"
      version                   = "0.1.1"
      verify                    = false
      namespace                 = "application"
      timeout                   = 300
      atomic                    = true
      max_history               = 10
      override_values           = data.template_file.hello-world.rendered
      set = [
        {
          name = "nameOverride"
          value = "hello-world"
        },
        {
          name = "fullnameOverride"
          value = "hello-world"
        },
      ]
    }
  }
}