variable "charts" {
  description = "List of helm charts to release"
  type = map(
    object(
      {
        release_name              = string
        repository_url            = string
        name                      = string
        version                   = string
        verify                    = bool
        namespace                 = string
        timeout                   = number
        atomic                    = bool
        max_history               = number
        override_values           = string
        set = list(
          object(
            {
              name  = string
              value = any
            }
          )
        )
      }
    )
  )
}

variable "cluster_name" {
  description = "Name of the target cluster to install helm charts"
  type        = string
}
