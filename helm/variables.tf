variable "nginx_namespace" {
  description = "Namespace for NGINX Ingress"
  type        = string
  default     = "kube-system"
}

variable "cert_manager_namespace" {
  description = "Namespace for Cert-Manager"
  type        = string
  default     = "cert-manager"
}

variable "cert_manager_version" {
  description = "Cert-Manager chart version"
  type        = string
  default     = "v1.15.0"
}

variable "nginx_chart_values_file" {
  description = "Path to NGINX Helm values.yaml"
  type        = string
  default     = "values.yaml"
}
