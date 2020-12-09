---
nameOverride: external-dns
fullnameOverride: external-dns
provider: aws
aws:
  region: "${region}"
  zoneType: "public"
  preferCNAME: "true"

domainFilters: ["${domain}"]
zoneIdFilters: ["${zone_id}"]
logFormat: json
replicas: 2
serviceAccount:
  create: true
  name: external-dns
  annotations:
    "eks.amazonaws.com/role-arn": "${role_arn}"

metrics:
  enabled: true
  serviceMonitor:
    enabled: true
    selector:
      release: prometheus-operator
# Chart:
# https://artifacthub.io/packages/helm/bitnami/external-dns
# Default values:
# https://github.com/bitnami/charts/blob/master/bitnami/external-dns/values.yaml
