variable "do_token" {
  type        = string
  description = "Token para acesso aos recursos da Digital Ocean"
}

variable "droplet_image" {
  type        = string
  description = "Imagem base do droplet"
  default     = "ubuntu-20-04-x64"
}

variable "datacenter_region" {
  type        = string
  description = "Região onde os droplets vao ser criados"
  default     = "ams3"
}

variable "droplet_size" {
  type        = string
  description = "tTamanho do droplet"
  default     = "s-1vcpu-1gb"
}

variable "droplet_ssh_keys" {
  type        = list(string)
  description = "Lista de chaves para acessarem o droplet"
  default     = ["05:d1:cd:7a:66:dd:95:05:bd:e0:48:b9:b6:e8:b6:62"]
}

variable "droplet_names" {
  type    = list(string)
  default = ["terraform"]
}

variable "private_key_path" {
  type        = string
  description = "Caminho para a chave privada"
  default     = "./id_rsa"
}

variable "lb_name" {
  type        = string
  description = "Nome do load balance"
  default     = "hashicourse"
}

variable "pg_cluster_name" {
  type        = string
  description = "Nome do nosso cluster de pg"
  default     = "postgres-cluster"
}

variable "pg_cluster_version" {
  type        = string
  description = "Versão do nosso cluster de ph"
  default     = "12"
}
variable "pg_cluster_size" {
  type        = string
  description = "Tamanho do nosso node do cluster pg"
  default     = "db-s-1vcpu-1gb"
}

variable "pg_node_count" {
  type        = number
  description = "Numero de nodes no nosso cluster"
  default     = 1
}

variable "database_name" {
  type        = string
  description = "Nome do banco de dados"
  default     = "Limerick"
}

variable "database_username" {
  type        = string
  description = "Username para o banco de dados"
  default     = "ireland"
}

variable "firewall_name" {
  type        = string
  description = "Nome do firewall"
  default     = "braum"
}

variable "troubleshooting" {
  type        = bool
  description = "Liberar acesso aos droplets na porta 22 (ssh)"
  default     = false
}

variable "subdomain" {
  type        = string
  description = "Nome do subdominio."
  default     = "terraform"
}

variable "domain" {
  type        = string
  description = "Nome do dominio"
  default     = "terraform.com"
}

variable "environment_name" {
  type        = string
  description = "Nome do ambiente"
  default     = "PROD"
}
