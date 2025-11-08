resource "helm_release" "nginx_ingress" {
  name       = "nginx-ingress"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  namespace  = var.nginx_namespace
  create_namespace = true

  values = [
    file(var.nginx_chart_values_file)
  ]
}


resource "helm_release" "cert_manager" {
  name = "cert-manager"

  repository       = "https://charts.jetstack.io"
  chart            = "cert-manager"
  namespace        = var.cert_manager_namespace
  create_namespace = true
  version          = var.cert_manager_version

  set {
    name  = "installCRDs"
    value = "true"
  }

  depends_on = [helm_release.nginx_ingress]
}

resource "helm_release" "grafana" {
  name = var.grafana_chart_name

  repository       = var.grafana_chart_repository
  chart            = var.grafana_chart_name
  namespace        = var.nginx_namespace
  version          = var.eks_version
  create_namespace = true

  values = [
    templatefile("${path.module}/../values/grafana.yaml.tftpl", {
      admin_user     = var.grafana_admin_user
      admin_password = var.grafana_admin_password
      grafana_host   = var.grafana_hostname
    })
  ]

  depends_on = [helm_release.nginx_ingress]
}
