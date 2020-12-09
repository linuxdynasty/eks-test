# hello-world-chart

## How to build VPC

1. `cd vpc`
2. `terraform plan`
3. `terraform apply`

## How to build EKS

1. `cd cluster`
2. `terraform plan`
3. `terraform apply`

## How to deploy Helm Charts

1. `cd charts`
2. `terraform plan`
3. `terraform apply`

## Caveats....
the statsd-exporter helm chart is broken. I am going to place a PR in order to fix it.
This https://github.com/prometheus-community/helm-charts/blob/main/charts/prometheus-statsd-exporter/templates/servicemonitor.yaml#L19 should be `http` and not `metrics`.

I found this by running `kubectl get svc -n monitoring statsd-exporter -o yaml` and when I saw the port was set to `metrics` I checked the servicemonitor.yaml template and realized it was hard coded.

## URLS

* http://grafana.allen-test.dynasticld.com
* http://statsd.allen-test.dynasticld.com
* http://prometheus.allen-test.dynasticld.com
* http://alertmanager.allen-test.dynasticld.com
* http://hello.allen-test.dynasticld.com

## What I built manually.

* The S3 Buckets for the terraform state.
  https://homeadvisor-test-allen-terraform.s3-us-west-2.amazonaws.com/test/charts.tfstate
  https://homeadvisor-test-allen-terraform.s3-us-west-2.amazonaws.com/test/eks.tfstate
  https://homeadvisor-test-allen-terraform.s3-us-west-2.amazonaws.com/test/vpc.tfstate
  https://homeadvisor-test-allen-kubeconfigs.s3-us-west-2.amazonaws.com/homeadvisor-test-allen-eks
* The Route53 Hosted Zone allen-test.dynasticld.com: