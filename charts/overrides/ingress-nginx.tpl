## nginx configuration
## Ref: https://github.com/kubernetes/ingress-nginx/blob/master/controllers/nginx/configuration.md
##

controller:
  admissionWebhooks:
    enabled: false
  updateStrategy:
    rollingUpdate:
      maxUnavailable: 1
    type: RollingUpdate

  minReadySeconds: 20

  replicaCount: 2
  minAvailable: 1

  resources:
    limits:
      cpu: 100m
      memory: 90Mi
    requests:
      cpu: 100m
      memory: 90Mi

  autoscaling:
    enabled: true

  metrics:
    port: 10254
    # if this port is changed, change healthz-port: in extraArgs: accordingly
    enabled: true
    serviceMonitor:
      enabled: true
      namespace: monitoring
      additionalLabels:
        release: prometheus-operator
      scrapeInterval: 5s

    service:
      annotations:
        prometheus.io/scrape: "true"
        prometheus.io/port: "10254"

defaultBackend:
  enabled: true

  replicaCount: 2

  minAvailable: 1

  resources:
    limits:
      cpu: 10m
      memory: 20Mi
    requests:
      cpu: 10m
      memory: 20Mi

  autoscaling:
    enabled: true
