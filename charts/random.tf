resource "random_password" "grafana_password" {
  length  = 8
  special = false
  upper   = true
}
