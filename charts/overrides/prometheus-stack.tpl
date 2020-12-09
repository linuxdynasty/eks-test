alertmanager:
  ingress:
    enabled: true
    annotations: {
      kubernetes.io/ingress.class: "nginx"
    }
    hosts:
      - "alertmanager.${domain}"

grafana:
  adminPassword: "${grafana_password}"
  ingress:
    enabled: true
    annotations: {
      kubernetes.io/ingress.class: "nginx"
    }
    hosts:
      - "grafana.${domain}"
  sidecar:
    dashboards: 
      enabled: true

prometheus:
  ingress:
    enabled: true
    annotations: {
      kubernetes.io/ingress.class: "nginx",
    }
    hosts:
      - "prometheus.${domain}"
  prometheusSpec:
    storageSpec:
      volumeClaimTemplate:
        spec:
          storageClassName: gp2
          accessModes: ["ReadWriteOnce"]
          resources:
            requests:
              storage: 50Gi
    ruleSelector:
      matchExpressions:
        - key: app
          operator: In
          values:
            - prometheus
            - prometheus-operator
            - prometheus-stack
    serviceMonitorSelector: {}
    serviceMonitorSelectorNilUsesHelmValues: false