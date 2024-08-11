resource "grafana_user" "users" {
  for_each = var.users
  email    = "${each.key}@localhost"
  name     = each.key
  login    = each.key
  #password = var.g_pass
  password = each.value.password
  is_admin = each.value.is_admin

}

# resource "grafana_team" "admins" {
#   name = "admins"
#   members = [
#     grafana_user.najme.email,
#   ]
# }

# resource "null_resource" "test" {
#   depends_on = [ 
#     grafana_user.najme,
#     grafana_team.admins,
#     ]
# }
