resource "helm_release" "this" {
  for_each    = var.charts
  name        = each.value.release_name
  repository  = each.value.repository_url
  chart       = each.value.name
  version     = each.value.version
  values      = [each.value.override_values]
  verify      = each.value.verify
  namespace   = each.value.namespace
  timeout     = each.value.timeout
  atomic      = each.value.atomic
  max_history = each.value.max_history
  dynamic "set" {
    iterator = item
    for_each = each.value.set == null ? [] : each.value.set
    content {
      name  = item.value.name
      value = item.value.value
    }
  }
}
