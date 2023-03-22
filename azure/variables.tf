variable "azure_client_id" {
  description = "The Azure Client ID"
  type = string
}

variable "azure_client_secret" {
  description = "The Azure Client Secret"
  type = string
}

variable "azure_subscription_id" {
  description = "The Azure Subscription ID"
  type = string
}

variable "azure_tenant_id" {
  description = "The Azure Tenant ID"
  type = string
}

variable "backend_address_pool_name" {
  default = "myBackendPool"
}

variable "frontend_port_name" {
  default = "myFrontendPort"
}

variable "frontend_ip_configuration_name" {
  default = "myAGIPConfig"
}

variable "http_setting_name" {
  default = "myHTTPsetting"
}

variable "listener_name" {
  default = "myListener"
}

variable "request_routing_rule_name" {
  default = "myRoutingRule"
}