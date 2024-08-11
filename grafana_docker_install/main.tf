resource "docker_container" "grafana" {
  name  = "grafana_team_a"
  image = "grafana/grafana"
  ports {
    internal = 3000
    external = 3000
  }
}
resource "time_sleep" "wait_grafana_ready" {
  create_duration = "10s"
  depends_on      = [docker_container.grafana]
}
resource "grafana_user" "admin" {
  login    = "lzadmin"
  email    = "lzadmin@localhost"
  password = var.g_pass
  is_admin = true
  depends_on = [docker_container.grafana,
    time_sleep.wait_grafana_ready,
  ]
  lifecycle {
    ignore_changes = [ 
        email, 
        password,
     ]
     prevent_destroy = false
  }

}
