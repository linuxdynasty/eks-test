
statsdExporter: "${statsd-exporter}"

serviceAccount:
  create: true
  annotations: {}
  name: ""

podAnnotations: {}

ingress:
  enabled: true
  annotations:
    kubernetes.io/ingress.class: "nginx"
  hosts:
    - host: "hello.${domain}"
      paths:
        - "/"
        - "/metrics"

resources:
  limits:
    cpu: 100m
    memory: 128Mi
  requests:
    cpu: 100m
    memory: 128Mi

autoscaling:
  enabled: true
  minReplicas: 1
  maxReplicas: 3
  targetCPUUtilizationPercentage: 80

serviceMonitor:
  enabled: true
  namespace: monitoring
  additionalLabels:
    release: prometheus-operator