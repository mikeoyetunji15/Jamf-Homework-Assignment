provider "helm" {
  kubernetes {
    config_path = var.kubeconfig_path
  }
}

resource "helm_release" "wordpress" {
  name             = "wordpress"
  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "wordpress"
  version          = "22.4.6"

  namespace        = "wordpress"
  create_namespace = true

  timeout = 600

  values = [
    file("${path.module}/../helm/wordpress/values.yaml")
  ]
}