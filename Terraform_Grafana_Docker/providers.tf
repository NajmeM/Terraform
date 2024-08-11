provider "docker" {}

provider "grafana" {
  url  = "http://localhost:${docker_container.grafana.ports[0].external}/"
  auth = "admin:admin"
}