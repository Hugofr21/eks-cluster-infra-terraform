output "nginx_ingress_name" {
  value       = helm_release.nginx_ingress.name
  description = "Release name of the NGINX Ingress Helm chart"
}

output "cert_manager_name" {
  value       = helm_release.cert_manager.name
  description = "Release name of the Cert-Manager Helm chart"
}

output "nginx_ingress_namespace" {
  value       = var.nginx_namespace
  description = "Namespace where NGINX Ingress is installed"
}

output "cert_manager_namespace" {
  value       = var.cert_manager_namespace
  description = "Namespace where Cert-Manager is installed"
}
