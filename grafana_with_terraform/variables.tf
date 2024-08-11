# variable "g_pass" {
#   type        = string
#   description = "Grafana Password"
# }

variable "users" {
  type = map(object({
    password = string
    is_admin = bool
  }))
  description = "Lists of Grafana Users"
  default = {
    "najme" = {
      password = "najme123"
      is_admin = true
    },
    "mehdi" = {
      password = "mehdi456"
      is_admin = false
    },
    "dws" = {
      password = "dws789"
      is_admin = true
    },
    "test" = {
      password = "test1"
      is_admin = false
    }

  }
  
}