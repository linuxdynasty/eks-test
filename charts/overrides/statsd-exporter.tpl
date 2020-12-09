ingress:
  enabled: true
  annotations:
    kubernetes.io/ingress.class: nginx
  hosts: 
    - host: "statsd.${domain}"
      paths:
        - "/"
        - "/metrics"

serviceAccount:
  create: true
  name: "statsd-exporter"

serviceMonitor:
  enabled: true
  interval: 30s
  scrapeTimeout: 10s
  namespace: monitoring
  additionalLabels:
    release: prometheus-operator