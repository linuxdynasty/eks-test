resource "aws_s3_bucket" "kubeconfigs" {
  bucket = "homeadvisor-test-allen-kubeconfigs"
  acl    = "private"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  versioning {
    enabled = true
  }
}

resource "local_file" "kubeconfig" {
  depends_on = [module.eks.kubeconfig]
  content    = module.eks.kubeconfig
  filename   = "${path.module}/kubeconfig"
}

resource "aws_s3_bucket_object" "kubeconfig" {
  depends_on             = [local_file.kubeconfig]
  bucket                 = aws_s3_bucket.kubeconfigs.id
  key                    = module.eks.cluster_id
  source                 = "${path.module}/kubeconfig"
  server_side_encryption = "aws:kms"
  etag                   = md5(module.eks.kubeconfig)
}
