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


variable "grafana_namespace" {
  description = "Namespace for Grafana"
  type        = string
  default     = "monitoring"
}

variable "grafana_chart_version" {
  description = "Grafana chart version"
  type        = string
  default     = "10.1.1"
}

variable "grafana_chart_repository" {
  description = "Repository for Grafana chart"
  type        = string
  default     = "https://grafana.github.io/helm-charts"
}

variable "grafana_chart_name" {
  description = "Chart name for Grafana"
  type        = string
  default     = "grafana"
}



variable "grafana_admin_user" {
  description = "The username for Grafana admin"
  default = "admin"
  type = string
}

variable "grafana_admin_password" {
  description = "The password for the Grafana admin."
  sensitive = true
  type = string
}

variable "grafana_hostname" {
  description = "The hostname for Ingress (e.g., grafana.domain.com)"
  type = string
}